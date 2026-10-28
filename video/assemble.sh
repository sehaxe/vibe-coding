#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
RAW=$(ls -t raw/*.webm | head -1)
MUSIC=$(ls music/nangs.* 2>/dev/null | head -1 || true)
OUT=out/vibe-coding-promo.mp4
DUR=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$RAW")
FADE_OUT=$(python3 -c "print(max(0,float('$DUR')-1.2))")
if [ -n "$MUSIC" ]; then
  ffmpeg -y -i "$RAW" -i "$MUSIC" \
    -filter_complex "[0:v]fade=t=in:st=0:d=0.6,fade=t=out:st=${FADE_OUT}:d=1.2[v];[1:a]atrim=0:${DUR},afade=t=in:st=0:d=1,afade=t=out:st=${FADE_OUT}:d=1.2[a]" \
    -map "[v]" -map "[a]" -c:v libx264 -pix_fmt yuv420p -crf 18 -preset slow -c:a aac -b:a 192k -shortest "$OUT"
else
  ffmpeg -y -i "$RAW" \
    -vf "fade=t=in:st=0:d=0.6,fade=t=out:st=${FADE_OUT}:d=1.2" \
    -c:v libx264 -pix_fmt yuv420p -crf 18 -preset slow -an "$OUT"
  echo "no music file found in video/music/ — video is silent"
fi
echo "wrote $OUT"
