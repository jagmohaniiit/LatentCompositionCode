# LatentCompositionCode
This code demonstrates how to compute GMAP metric.
To generate the results use the following steps:

1) Place the comparison scores with FRS name subfolder for eg ComparisonScores\Arcface and ComparisonScores\VGGFace.

2) Generate FFMPMR and FTAR (Failure to Acquire Rate) for eg generateFFMPRValuesDatasetArcface and generateFFMPRValuesDatasetVGGFace.

3) Execute generateGMAPMetric to generate GMAP (Multiple Probe Attempts), GMAP (Multiple FRS and Multiple Probe Attempts) and GMAP. The regions are according to the 
paper (https://ieeexplore.ieee.org/document/10078862).
