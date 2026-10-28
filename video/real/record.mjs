import { chromium } from 'playwright-core';
import { existsSync, mkdirSync } from 'node:fs';

const CHROME = process.env.CHROME_PATH || '/home/sehaxe/.cache/ms-playwright/chromium-1243/chrome-linux64/chrome';
if (!existsSync(CHROME)) { console.error('no chrome'); process.exit(1); }

const scenario = process.argv[2] || 'gostpadi';
const OUT = `out/${scenario}`;
mkdirSync(OUT, { recursive: true });

const CODE = `int main() {
  int n;
  scanf("%d", &n);
  if (n > 0) {
    printf("positive");
  } else {
    printf("not positive");
  }
  for (int i = 0; i < n; i++) {
    printf("%d", i);
  }
  return 0;
}`;

const browser = await chromium.launch({ executablePath: CHROME, headless: true });
const ctx = await browser.newContext({
  viewport: { width: 1920, height: 1080 },
  recordVideo: { dir: OUT, size: { width: 1920, height: 1080 } },
  deviceScaleFactor: 1
});
const page = await ctx.newPage();
page.on('pageerror', e => console.error('PAGEERROR', e.message));

await page.addInitScript(() => {
  const mount = () => {
    if (document.getElementById('__cur')) return;
    const c = document.createElement('div');
    c.id = '__cur';
    c.style.cssText = 'position:fixed;left:0;top:0;width:22px;height:26px;z-index:2147483647;pointer-events:none;will-change:transform;filter:drop-shadow(0 2px 3px rgba(0,0,0,.35))';
    c.innerHTML = '<svg viewBox="0 0 24 28" width="22" height="26"><path d="M3 2l16 12-7 1.2L9.5 23 3 2z" fill="#0f0f0f" stroke="#fff" stroke-width="1.6" stroke-linejoin="round"/></svg>';
    document.documentElement.appendChild(c);
    addEventListener('mousemove', (e) => { c.style.transform = `translate(${e.clientX}px,${e.clientY}px)`; });
    addEventListener('mousedown', (e) => {
      const r = document.createElement('div');
      r.style.cssText = `position:fixed;left:${e.clientX}px;top:${e.clientY}px;width:10px;height:10px;border:2px solid rgba(0,0,0,.45);border-radius:50%;transform:translate(-50%,-50%);z-index:2147483646;pointer-events:none;animation:__rip .5s ease-out forwards`;
      document.documentElement.appendChild(r);
      setTimeout(() => r.remove(), 600);
    });
    const st = document.createElement('style');
    st.textContent = '@keyframes __rip{0%{opacity:.8;transform:translate(-50%,-50%) scale(.2)}100%{opacity:0;transform:translate(-50%,-50%) scale(2.6)}}';
    document.documentElement.appendChild(st);
  };
  if (document.body) mount(); else addEventListener('DOMContentLoaded', mount);
});

const wait = (ms) => page.waitForTimeout(ms);

async function center(selectorOrLocator) {
  const loc = typeof selectorOrLocator === 'string' ? page.locator(selectorOrLocator).first() : selectorOrLocator;
  const box = await loc.boundingBox();
  if (!box) throw new Error('no box for ' + selectorOrLocator);
  return { x: box.x + box.width / 2, y: box.y + box.height / 2 };
}

async function moveTo(x, y, ms = 700) {
  await page.mouse.move(x, y, { steps: Math.max(8, Math.round(ms / 25)) });
  await wait(ms);
}

async function clickAt(x, y) {
  await moveTo(x, y, 450);
  await page.mouse.down();
  await wait(90);
  await page.mouse.up();
  await wait(350);
}

async function clickSel(sel) {
  const p = await center(sel);
  await clickAt(p.x, p.y);
}

async function typeInto(sel, text) {
  await clickSel(sel);
  await page.keyboard.type(text, { delay: 22 });
  await wait(250);
}

async function dismiss(text) {
  const btn = page.locator(`button:has-text("${text}")`).first();
  if (await btn.count()) await clickSel(btn);
}

if (scenario === 'gostpadi') {
  await page.goto('https://sehaxe.github.io/gostpadi/app.html', { waitUntil: 'networkidle' });
  await wait(1600);
  await dismiss('Понятно');
  await wait(500);
  await clickSel('textarea');
  await page.keyboard.insertText(CODE);
  await wait(900);
  await clickSel('button:has-text("Схема")');
  await wait(2200);
  const plus = page.locator('button:has-text("+")').first();
  if (await plus.count()) { await clickSel(plus); await wait(350); await clickSel(plus); await wait(600); }
  const scheme = await page.locator('svg').first().boundingBox();
  if (scheme) { await moveTo(scheme.x + scheme.width * 0.62, scheme.y + scheme.height * 0.42, 900); }
  await wait(2600);
} else if (scenario === 'labpad') {
  await page.goto('http://127.0.0.1:8099/app.html', { waitUntil: 'networkidle' });
  await wait(1400);
  await dismiss('Понятно');
  await wait(400);
  await typeInto('#f-name', 'Дерновский Арсений');
  await typeInto('#f-topic', 'Блок-схемы из C-кода');
  await wait(400);
  await clickSel('button:has-text("+ задание")');
  await wait(800);
  await clickSel('text=Задание №1');
  await wait(900);
  const box = await page.evaluate(() => {
    const t = [...document.querySelectorAll('textarea')].find(x => x.value.includes('#include'));
    if (!t) return null;
    t.focus(); t.select();
    const r = t.getBoundingClientRect();
    return { x: r.x + r.width / 2, y: r.y + 30 };
  });
  if (box) { await clickAt(box.x, box.y); await page.keyboard.press('Control+A'); await page.keyboard.insertText(CODE); }
  await wait(900);
  const draw = page.locator('button:has-text("нарисовать из кода")').first();
  await draw.scrollIntoViewIfNeeded();
  const dp = await draw.boundingBox();
  if (dp) await clickAt(dp.x + dp.width / 2, dp.y + dp.height / 2);
  await wait(2800);
  await page.evaluate(() => {
    const b = [...document.querySelectorAll('button')].find(x => x.textContent.includes('нарисовать из кода'));
    if (b) b.scrollIntoView({ block: 'center', behavior: 'smooth' });
  });
  await wait(1000);
  const svg = await page.locator('svg').first().boundingBox();
  if (svg) await moveTo(svg.x + svg.width * 0.55, svg.y + svg.height * 0.45, 900);
  await wait(2600);
}

const video = page.video();
const p = await video.path();
await ctx.close();
await browser.close();
console.log(p);
