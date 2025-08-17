# Image Optimization Tools: **OptiPNG** & **JPEGOptim**

## OptiPNG (for PNG files)

### Installation

```bash
sudo apt update
sudo apt install optipng
```

### Usage

* **Basic optimization (lossless)**

  ```bash
  optipng image.png
  ```

  Optimizes `image.png` (backup saved as `image.png.bak`).

* **Set optimization level** (`0` = fastest, `7` = best compression)

  ```bash
  optipng -o7 image.png
  ```

* **Process multiple files**

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

**Note:** OptiPNG is always **lossless**.

---

## 🔹 JPEGOptim (for JPEG files)

### Installation

```bash
sudo apt update
sudo apt install jpegoptim
```

### Usage

* **Lossless optimization (default)**

  ```bash
  jpegoptim image.jpg
  ```

  Optimizes Huffman tables, removes unnecessary data, but **does not reduce quality**.

* **Set maximum quality (lossy mode)**

  ```bash
  jpegoptim --max=90 image.jpg
  ```

  Re-encodes with a maximum quality of 90 (reduces size more, but slightly lossy).

* **Batch optimization**

  ```bash
  jpegoptim --max=85 *.jpg
  ```

* **Strip metadata (EXIF, comments, etc.)**

  ```bash
  jpegoptim --strip-all image.jpg
  ```

**Note:**

* **Without `--max`** → compression is **lossless**.
* **With `--max`** → compression is **lossy**, capped at given quality.

---

## 📌 Quick Comparison

| Tool      | Format | Lossless  | Lossy Option   | Best Use Case                           |
| --------- | ------ | --------- | -------------- | --------------------------------------- |
| OptiPNG   | PNG    | ✅ Always  | ❌              | Shrink PNGs without losing quality      |
| JPEGOptim | JPEG   | ✅ Default | ✅ With `--max` | Choose between lossless or lossy shrink |


