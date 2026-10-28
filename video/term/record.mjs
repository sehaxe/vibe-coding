import { chromium } from 'playwright-core';
import { existsSync } from 'node:fs';
const CHROME = process.env.CHROME_PATH || '/home/sehaxe/.cache/ms-playwright/chromium-1243/chrome-linux64/chrome';
if (!existsSync(CHROME)) { console.error('no chrome'); process.exit(1); }
const browser = await chromium.launch({ executablePath: CHROME, headless: true });
const ctx = await browser.newContext({
  viewport: { width: 1920, height: 1080 },
  recordVideo: { dir: 'out/raw', size: { width: 1920, height: 1080 } },
  deviceScaleFactor: 1
});
const page = await ctx.newPage();
page.on('pageerror', e => console.error('PAGEERROR', e.message));
await page.goto('http://127.0.0.1:8110/', { waitUntil: 'load' });
await page.waitForTimeout(9000);
await page.click('#term');
await page.waitForTimeout(600);
await page.keyboard.type('add a dark mode toggle to index.html. plan first, then edit the file.', { delay: 12 });
await page.waitForTimeout(500);
await page.keyboard.press('Enter');
const t0 = Date.now();
let idle = 0;
while (Date.now() - t0 < 90000) {
  await page.waitForTimeout(1500);
  const busy = await page.evaluate(() => window.term.buffer.active.getLine(window.term.buffer.active.length - 2)?.translateToString(true).includes('esc interrupt') || false);
  if (busy) idle = 0; else idle += 1500;
  if (idle > 4000) break;
}
await page.waitForTimeout(2500);
const video = page.video();
const p = await video.path();
await ctx.close();
await browser.close();
console.log(p);
