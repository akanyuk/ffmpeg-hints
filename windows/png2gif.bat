# генерируем палитру на основе кадров
ffmpeg -i %02d.png -vf palettegen palette.png

# используем палитру для генерации гифок
ffmpeg -i %02d.png -i palette.png  -lavfi "paletteuse" -y stages.gif
