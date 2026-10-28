import http from 'node:http';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawn } from 'node:child_process';
import { WebSocketServer } from 'ws';

const ROOT = path.dirname(fileURLToPath(import.meta.url));
const PUBLIC = path.join(ROOT, 'public');
const PORT = Number(process.env.PORT || 8110);
const MIME = { '.html': 'text/html', '.js': 'text/javascript', '.css': 'text/css', '.png': 'image/png' };

const server = http.createServer((req, res) => {
  const url = (req.url || '/').split('?')[0];
  const file = url === '/' ? path.join(PUBLIC, 'index.html') : path.join(PUBLIC, url);
  if (!file.startsWith(PUBLIC)) { res.writeHead(403); res.end(); return; }
  fs.readFile(file, (err, buf) => {
    if (err) { res.writeHead(404); res.end('not found'); return; }
    res.writeHead(200, { 'content-type': MIME[path.extname(file)] || 'application/octet-stream' });
    res.end(buf);
  });
});

const wss = new WebSocketServer({ server, path: '/ws' });
wss.on('connection', (ws) => {
  const child = spawn('python3', [path.join(ROOT, 'pty_bridge.py')], {
    cwd: process.env.DEMO_CWD || ROOT,
    env: { ...process.env }
  });
  child.stdout.on('data', (d) => { if (ws.readyState === 1) ws.send(d); });
  child.stderr.on('data', (d) => process.stderr.write(d));
  child.on('exit', () => { try { ws.close(); } catch {} });
  ws.on('message', (m) => { try { child.stdin.write(m); } catch {} });
  ws.on('close', () => { try { child.kill('SIGTERM'); } catch {} });
});

server.listen(PORT, '127.0.0.1', () => console.log(`http://127.0.0.1:${PORT}/`));
