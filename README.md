# exifree

Strip metadata from photos — in the browser, zero server upload.

## What it does

- Reads EXIF data from images (JPEG, PNG, WebP)
- Displays found metadata (GPS, device, timestamp, orientation)
- Exports a clean image with all metadata removed
- Everything happens client-side — the image never leaves your device
- Supports HEIC by lazily loading a WebAssembly converter — iPhone photos are processed locally, no upload

## Why

Some apps strip EXIF, some don't. Instead of guessing — clean once before sending.

## Usage

Open `app/index.html` in your browser. Drop an image. Download clean.

Live: (https://exifree.com/en/)

## License

MIT
