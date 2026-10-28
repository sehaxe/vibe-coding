import { chromium } from 'playwright-core';
import { existsSync, mkdirSync, rmSync } from 'node:fs';
const CHROME = process.env.CHROME_PATH || '/home/sehaxe/.cache/ms-playwright/chromium-1243/chrome-linux64/chrome';
if (!existsSync(CHROME)) { console.error('no chrome'); process.exit(1); }
const FPS = Number(process.env.FPS || 30);
const DUR = 108.54;
const N = Math.round(DUR * FPS);
const DIR = 'frames';
mkdirSync(DIR, { recursive: true });
const browser = await chromium.launch({ executablePath: CHROME, headless: true });
const page = await browser.newPage({ viewport: { width: 1920, height: 1080 }, deviceScaleFactor: 1 });
page.on('pageerror', e => console.error('PAGEERROR', e.message));
await page.goto('http://127.0.0.1:8100/video/promo/film.html', { waitUntil: 'load' });
await page.waitForFunction('window.__ready === true', null, { timeout: 30000 });
const t0 = Date.now();
for (let i = 0; i < N; i++) {
  await page.evaluate((t) => window.seek(t), i / FPS);
  await page.screenshot({ path: `${DIR}/f${String(i).padStart(5, '0')}.jpg`, type: 'jpeg', quality: 92 });
  if (i % 200 === 0) console.log(i, ((Date.now() - t0) / 1000).toFixed(1) + 's');
}
console.log('done', N, ((Date.now() - t0) / 1000).toFixed(1) + 's');
await browser.close();
