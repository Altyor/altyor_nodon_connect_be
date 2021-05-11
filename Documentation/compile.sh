echo "Compilation of document starting ...."


rm index.html
# rm -rf ./img
# mkdir ./img

# find ../Protocols/ -name "*.jpg" -type f -exec cp {} ./img \;
# find ../Protocols/ -name "*.png" -type f -exec cp {} ./img \;
# find ../Protocols/ -name "*.jpeg" -type f -exec cp {} ./img \;
# find ../Protocols/ -name "*.svg" -type f -exec cp {} ./img \;
# cp ../img/Altyor.png ./img

# cat ./index.md >> final.md
# cat $(find ../Protocols/ -name '*.md' ) >> final.md

pandoc --template=./GitHub.html5 --self-contained  --metadata pagetitle="NODON CONNECT BE - SPECIFICATIONS " Specifications.md -o index.html

open index.html

