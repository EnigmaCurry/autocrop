# ImageMagick autocrop of a directory of JPG images

This BASH script will automatically crop an entire directory of
scanned JPG images. 

Install ImageMagick: `sudo apt install imagemagick`

Run the script like this:

`./auto-crop.sh test-scans test-crops`

 * `test-scans` is the example directory containing your scanned images.

 * `test-crops` is the example directory that will output your cropped
images (will be created if it doesn't exist)

Adjust the `FUZZ` percentage in the script to tweak the amount of
acceptable color differences in the scanned images.
