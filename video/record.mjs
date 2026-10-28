import { chromium } from 'playwright-core';
import { existsSync, mkdirSync } from 'node:fs';

const CHROME = process.env.CHROME_PATH ||
  '/home/sehaxe/.cache/ms-playwright/chromium-1243/chrome-linux64/chrome';
if (!existsSync(CHROME)) { console.error('chrome not found:', CHROME); process.exit(1); }
mkdirSync('video/raw', { recursive: true });

const browser = await chromium.launch({ executablePath: CHROME, headless: true, args: ['--force-device-scale-factor=1'] });
const ctx = await browser.newContext({
  viewport: { width: 1920, height: 1080 },
  recordVideo: { dir: 'video/raw', size: { width: 1920, height: 1080 } },
  deviceScaleFactor: 1
});
const page = await ctx.newPage();
page.on('pageerror', e => console.error('PAGEERROR', e.message));
await page.goto('http://127.0.0.1:8100/video/stage.html?record=1', { waitUntil: 'load' });
await page.waitForFunction('window.__done === true', null, { timeout: 180000 });
await page.waitForTimeout(600);
const video = page.video();
const path = await video.path();
await ctx.close();
await browser.close();
console.log(path);
