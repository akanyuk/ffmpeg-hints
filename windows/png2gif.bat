# generating a palette based on frames
ffmpeg -i %02d.png -vf palettegen palette.png

# uses a palette to generate GIFs
ffmpeg -i %02d.png -i palette.png  -lavfi "paletteuse" -y stages.gif
