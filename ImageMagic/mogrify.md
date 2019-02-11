# Mogrify commands

Tips !

## Convert PDF to JPGs without quality compromise

All parameters below matter.

```
mogrify -format jpg -alpha off -quality 100 -resize 1000 -interlace none -density 300  Gehaltsschein.pdf
```

Pages will be converted as separate image files.
