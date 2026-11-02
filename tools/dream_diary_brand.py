#!/usr/bin/env python3
"""Reproduce Dream Diary's raster identity from the user-supplied artwork.

Only the new, small brand assets are ordinary Git blobs (see .gitattributes).
The upstream artwork is retained unchanged. Requires Pillow 11.3.0.
"""
from pathlib import Path
from PIL import Image, ImageOps, ImageEnhance, ImageDraw

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'res/dream-diary/icon.png'
BRAND = ROOT / 'mobile/assets/brand'
ANDROID = ROOT / 'mobile/android/app/src/main/res'


def save(image, path, size=None):
    path.parent.mkdir(parents=True, exist_ok=True)
    if size is not None:
        image = image.resize((size, size), Image.Resampling.LANCZOS)
    image.save(path, optimize=True)


def main():
    original = Image.open(SOURCE).convert('RGBA')
    # The supplied artwork already has rounded corners. Keep it intact for the
    # legacy icon; use a corner-free centre crop inside the adaptive safe zone.
    side = original.width
    inset = round(side * .17)
    centre = original.crop((inset, inset, side-inset, side-inset))
    save(original, BRAND / 'dream_diary_icon.png', 1024)
    variants = {'dream': original}
    gray = ImageOps.grayscale(centre)
    mono = ImageOps.colorize(gray, '#241c30', '#eee7f4').convert('RGBA')
    variants['mono'] = mono
    plum = ImageEnhance.Color(centre).enhance(.65)
    plum = ImageEnhance.Contrast(plum).enhance(1.08)
    variants['plum'] = plum.convert('RGBA')
    for name, image in variants.items():
        save(image, BRAND / f'icon_{name}.png', 512)
        for density, pixels in [('mdpi',48),('hdpi',72),('xhdpi',96),('xxhdpi',144),('xxxhdpi',192)]:
            save(image, ANDROID / f'mipmap-{density}/ic_{name}.png', pixels)
        foreground = Image.new('RGBA', (432,432), (0,0,0,0))
        # 66/108 dp is the adaptive-icon safe area. Never stretch a crop.
        art = image.resize((286,286), Image.Resampling.LANCZOS)
        foreground.alpha_composite(art, (73,73))
        save(foreground, ANDROID / f'drawable-nodpi/ic_{name}_foreground.png')
        mask = Image.new('L', (432,432), 0)
        ImageDraw.Draw(mask).rounded_rectangle((73,73,358,358), radius=54, fill=255)
        silhouette = Image.new('RGBA', (432,432), (255,255,255,0))
        silhouette.putalpha(mask)
        save(silhouette, ANDROID / f'drawable-nodpi/ic_{name}_monochrome.png')
    save(original, ANDROID / 'drawable-nodpi/dream_diary_splash.png', 512)
    # A fresh iOS catalog preserves all upstream resources for attribution/rollback.
    ios = ROOT / 'mobile/ios/Runner/Assets.xcassets/DreamDiaryAppIcon.appiconset'
    import json
    entries=[]
    for size in [20,29,40,58,60,76,80,87,120,152,167,180,1024]:
        filename=f'dream-{size}.png'
        save(original, ios/filename, size)
        idioms=[('iphone','2x')] if size in (58,87,120,180) else [('ipad','1x')] if size in (76,152,167) else [('ios-marketing','1x')] if size==1024 else [('iphone','2x'),('ipad','1x')]
        for idiom,scale in idioms:
            logical = size // int(scale[0])
            entries.append({'filename':filename,'idiom':idiom,'scale':scale,'size':f'{logical}x{logical}'})
    ios.mkdir(parents=True,exist_ok=True)
    (ios/'Contents.json').write_text(json.dumps({'images':entries,'info':{'author':'xcode','version':1}},indent=2)+'\n')

if __name__ == '__main__':
    main()
