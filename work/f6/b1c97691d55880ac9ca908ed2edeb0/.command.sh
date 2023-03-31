#!/bin/bash -ue
cellpose     --image_path image.backsub.ome.tif     --save_tif     --verbose     --pretrained_model nuclei --diameter 9 --channel_axis 0 --no_npy

cat <<-END_VERSIONS > versions.yml
"CELLPOSE":
    cellpose: 2.1.1
END_VERSIONS
