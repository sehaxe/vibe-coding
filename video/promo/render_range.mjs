import { chromium } from 'playwright-core';
const CHROME = process.env.CHROME_PATH || '/home/sehaxe/.cache/ms-playwright/chromium-1243/chrome-linux64/chrome';
const start = Math.round(60.58 * 60), end = Math.round(70.59 * 60);
const b = await chromium.launch({ executablePath: CHROME, headless: true });
const p = await b.newPage({ viewport: { width: 1920, height: 1080 }, deviceScaleFactor: 1 });
await p.goto('http://127.0.0.1:8100/video/promo/film.html?v=3', { waitUntil: 'load' });
await p.waitForFunction('window.__ready === true', null, { timeout: 30000 });
for (let i = start; i <= end; i++) {
  await p.evaluate((t) => window.seek(t), i / 60);
  await p.screenshot({ path: `frames/f${String(i).padStart(5, '0')}.jpg`, type: 'jpeg', quality: 92 });
  if (i % 150 === 0) console.log(i);
}
console.log('done', start, end);
await b.close();
