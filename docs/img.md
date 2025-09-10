# Image & PDF Optimization Tools

This guide covers useful command-line tools for compressing **PNG, JPEG, and PDF** files on Ubuntu.

---

## 🖼 PNG Optimization

### 🔹 OptiPNG (lossless)

#### Installation

```bash
sudo apt update
sudo apt install optipng
```

#### Usage

* **Basic optimization**

```bash
optipng image.png
```

* **Set optimization level** (`0` = fastest, `7` = best compression)

```bash
optipng -o7 image.png
```

* **Batch optimization**

```bash
optipng -o3 *.png
```

* **Strip metadata & overwrite without backup**

```bash
optipng -o7 -strip all -clobber image.png
```

* **Recursive batch optimization**

```bash
find . -iname '*.png' -exec optipng -o7 -strip all {} \;
```

✅ Always **lossless**.

---

### 🔹 PNGQuant (lossy, much smaller)

#### Installation

```bash
sudo apt install pngquant
```

#### Usage

* **Basic compression with quality range**

```bash
pngquant --quality=65-80 --ext .png --force image.png
```

* **Batch compression**

```bash
pngquant --quality=70-90 --ext .png --force *.png
```

⚠️ Slight quality loss, but files are **much smaller**.

---

### 🔹 ImageMagick (resize + compress)

#### Installation

```bash
sudo apt install imagemagick
```

#### Usage

* **Resize and compress**

```bash
convert image.png -resize 50% -strip -quality 85 compressed.png
```

Best when you also want to **resize**.

---

## 📸 JPEG Optimization

### 🔹 JPEGOptim

#### Installation

```bash
sudo apt update
sudo apt install jpegoptim
```

#### Usage

* **Lossless optimization (default)**

```bash
jpegoptim image.jpg
```

* **Set maximum quality (lossy)**

```bash
jpegoptim --max=90 image.jpg
```

* **Batch optimization**

```bash
jpegoptim --max=85 *.jpg
```

* **Strip metadata**

```bash
jpegoptim --strip-all image.jpg
```

✅ Without `--max` = **lossless**.
⚠️ With `--max` = **lossy**.

---

## 📄 PDF Compression

### 🔹 Ghostscript (best for strong compression)

#### Installation

```bash
sudo apt install ghostscript
```

#### Usage

* **Basic compression**

```bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen \
   -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf
```

* **Quality levels:**

  * `/screen` → smallest, low quality
  * `/ebook` → good balance
  * `/printer` → high quality, bigger size
  * `/prepress` → best quality

Example:

```bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
   -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed.pdf input.pdf
```

---

### 🔹 QPDF (lossless optimization)

#### Installation

```bash
sudo apt install qpdf
```

#### Usage

```bash
qpdf --linearize input.pdf output.pdf
```

Doesn’t reduce size much, but always **lossless**.

---

### 🔹 PDFTK (basic compression)

#### Installation

```bash
sudo apt install pdftk
```

#### Usage

```bash
pdftk input.pdf output compressed.pdf compress
```

---

## 📌 Quick Comparison

| Tool        | Format  | Lossless | Lossy | Best Use Case                         |
| ----------- | ------- | -------- | ----- | ------------------------------------- |
| OptiPNG     | PNG     | ✅ Yes    | ❌ No  | Shrink PNGs without losing quality    |
| PNGQuant    | PNG     | ❌ No     | ✅ Yes | Strong PNG compression, small size    |
| ImageMagick | PNG/JPG | ❌ No     | ✅ Yes | Resize + compress at same time        |
| JPEGOptim   | JPEG    | ✅ Yes    | ✅ Yes | Choose lossless or lossy shrink       |
| Ghostscript | PDF     | ❌ No     | ✅ Yes | Strong PDF compression, customizable  |
| QPDF        | PDF     | ✅ Yes    | ❌ No  | Optimize structure, keep full quality |
| PDFTK       | PDF     | ✅ Yes    | ❌ No  | Simple built-in compression           |

---

## ⚡ One-Liner Batch Scripts

Compress all images or PDFs in the **current folder** with one command:

* **All PNGs (lossless, OptiPNG)**

```bash
for f in *.png; do optipng -o7 -strip all "$f"; done
```

* **All PNGs (lossy, PNGQuant)**

```bash
for f in *.png; do pngquant --quality=65-80 --ext .png --force "$f"; done
```

* **All JPGs (JPEGOptim lossy, max=85)**

```bash
jpegoptim --max=85 --strip-all *.jpg
```

* **All PDFs (Ghostscript, good balance)**

```bash
for f in *.pdf; do gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="compressed_$f" "$f"; done
```
