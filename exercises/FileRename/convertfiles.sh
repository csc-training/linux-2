#!/bin/bash
echo "resizing and renaming the files"
sleep 2
for i in {0..9}; do  clear; echo "$i of 50";convert -resize 200% ${i}_singleframe_small.jpg 0${i}_singleframe_large.jpg; done
for i in {10..50}; do clear; echo "$i of 50";convert -resize 200% ${i}_singleframe_small.jpg ${i}_singleframe_large.jpg; done
echo "creating animated-GIF - please be patient"
convert *_singleframe_large.jpg animation.gif
echo "Done"
##### This is to ask interactively, wehther 
read -r -p "Remove the intermediate files (??_singleframe_large.jpg)? [Y/n]" response
response=${response,,} # tolower
if [[ $response =~ ^(yes|y| ) ]]; then
    rm -f ??_singleframe_large.jpg
fi
echo "All done. Run with: animate animation.gif"
