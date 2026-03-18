# exifree

Strip metadata from photos — in the browser, zero server upload.

## What it does

- Reads and displays metadata from JPEG, PNG, and WebP images
  - **JPEG**: full EXIF/XMP/IPTC block detection
  - **PNG**: reads `tEXt`, `iTXt`, `zTXt`, `eXIf`, `iCCP` chunks
  - **WebP**: reads `EXIF`, `XMP`, `ICCP` chunks
- Strips metadata by re-encoding through Canvas — removes GPS, device, date, EXIF, XMP, and text chunks
- Preserves original format: PNG stays PNG, WebP stays WebP, JPEG stays JPEG
- Supports HEIC/HEIF (iPhone photos) by lazily loading a WebAssembly converter from jsDelivr CDN — the image itself never leaves the device
- Everything happens client-side — the image never reaches any server

## Honest limitations

Metadata removal is done via Canvas re-encoding (`canvas.toBlob()`). This means:

- **Not lossless** — re-encoding at 0.95 quality may slightly change file size
- **Not 100% guaranteed** — Canvas-based stripping removes the vast majority of metadata, but edge cases in exotic formats may persist
- **HEIC requires CDN** — the HEIC→JPEG converter is loaded from jsDelivr on demand. The conversion runs locally; only the library script is fetched externally

For higher-assurance stripping, tools using libvips or ImageMagick (via WASM) offer more comprehensive coverage.

## Why

Some apps strip EXIF, some don't, and behaviour changes between versions. Instead of guessing — clean once before sending.

## Usage

Open `app/index.html` in your browser. Drop an image. Download clean.

Live: [https://exifree.com/en/](https://exifree.com/en/)

## License

MIT
