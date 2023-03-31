include { BACKSUB } from './modules/nf-core/backsub/main'
include { CELLPOSE } from './modules/nf-core/cellpose/main'
include { DEEPCELL_MESMER } from './modules/nf-core/deepcell/mesmer/main'
include { MCQUANT } from './modules/nf-core/mcquant/main'
include { SCIMAP_MCMICRO } from './modules/nf-core/scimap/mcmicro/main'

workflow{

    // Manually define inputs here
    image_tuple = tuple([ id:'image' ], '/Users/florian_wuennemann/1_Projects/nf_core/hackathon_march_2023/test_datasets/background_subtraction/cycif_tonsil_registered.ome.tif')
    marker_tuple = tuple([ id:'marker'], '/Users/florian_wuennemann/1_Projects/nf_core/hackathon_march_2023/test_datasets/background_subtraction/markers.csv')

    // Run the different processes
    BACKSUB(image_tuple,marker_tuple)
    CELLPOSE(BACKSUB.out.backsub_tif)
    MCQUANT(BACKSUB.out.backsub_tif,
            CELLPOSE.out.mask,
            BACKSUB.out.markerout)
    SCIMAP_MCMICRO(MCQUANT.out.csv)
}