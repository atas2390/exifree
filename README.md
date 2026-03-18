# exifree

Strip metadata from photos — in the browser, zero server upload.

## What it does

- Reads and displays metadata from JPEG, PNG, and WebP images
  - **JPEG**: full EXIF/XMP/IPTC block detection
  - **PNG**: reads `tEXt`, `iTXt`, `zTXt`, `eXIf`, `iCCP` chunks
  - **WebP**: reads `EXIF`, `XMP`, `ICCP` chunks
- Strips metadata via **lossless binary stripping** — metadata segments are removed directly from the file binary, image data is never touched
  - **JPEG**: removes APP1–APP15 (EXIF, XMP, ICC, IPTC, Adobe) and COM segments
  - **PNG**: removes `tEXt`, `iTXt`, `zTXt`, `eXIf`, `tIME`, `iCCP`, `pHYs`, `cHRM`, `gAMA`, `sRGB` chunks
  - **WebP**: removes `EXIF`, `XMP`, `ICCP` chunks and clears flags in `VP8X` header
- Output file size is nearly identical to the original — no re-encoding, no quality loss
- Supports HEIC/HEIF (iPhone photos) via a self-hosted WebAssembly converter — no external requests, the image never leaves the device
- Supports batch processing — drop multiple photos at once and download as a ZIP
- Shows file size before and after stripping
- Everything happens client-side — the image never reaches any server

## Why

Some apps strip EXIF, some don't, and behaviour changes between versions. Instead of guessing — clean once before sending.

## Usage

Open `app/index.html` in your browser. Drop one or more images. Download clean — single file or ZIP batch.

Live: [https://exifree.com/](https://exifree.com/)

## License

MIT
