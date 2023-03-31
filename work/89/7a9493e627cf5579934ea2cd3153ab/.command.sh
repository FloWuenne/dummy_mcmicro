#!/bin/bash -ue
python3 /background_subtraction/background_sub.py         -o "image.backsub.ome.tif"         -mo markers_bs.csv         -r cycif_tonsil_registered.ome.tif         -m markers.csv         

cat <<-END_VERSIONS > versions.yml
"BACKSUB":
    backsub: $(python3 /background_subtraction/background_sub.py --version | sed 's/v//g')
END_VERSIONS
