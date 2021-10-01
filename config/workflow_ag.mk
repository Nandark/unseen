# Configuration for ABARES wheat-sheep region analysis

VAR=pr
UNITS=${VAR}=mm/day

SHAPEFILE=/home/599/dbi599/unseen/shapefiles/wheat_sheep.zip
REGION_NAME=wheat-sheep
SHP_HEADER=region
SPATIAL_AGG=mean

TIME_FREQ=A-DEC
TIME_AGG=mean

BIAS_METHOD=additive
BASE_PERIOD=1990-01-01 2020-12-31

IO_OPTIONS=--variables ${VAR} --spatial_coords -44 -11 113 154 --shapefile ${SHAPEFILE} --shp_header ${SHP_HEADER} --combine_shapes --spatial_agg ${SPATIAL_AGG} --time_freq ${TIME_FREQ} --time_agg ${TIME_AGG} --complete_time_agg_periods --units ${UNITS}

FCST_DATA := $(sort $(wildcard /g/data/xv83/dcfp/CAFE-f6/c5-d60-pX-f6-??[9,0,1,2]*/atmos_isobaric_daily.zarr.zip))
FCST_METADATA=config/dataset_cafe_daily.yml
FCST_ENSEMBLE_FILE=/g/data/xv83/dbi599/ag/${VAR}_cafe-c5-d60-pX-f6_19900501-20201101_${TIME_FREQ}-${TIME_AGG}_${REGION_NAME}-${SPATIAL_AGG}.zarr.zip

OBS_DATA=/g/data/xv83/observations/AWAP/rain_day_19000101-20210425_cafe-grid.zarr.zip
OBS_METADATA=config/dataset_awap_daily.yml
OBS_PROCESSED_FILE=/g/data/xv83/dbi599/ag/${VAR}_awap_1900-2020_${TIME_FREQ}-${TIME_AGG}_${REGION_NAME}-${SPATIAL_AGG}.zarr.zip

FCST_BIAS_FILE=/g/data/xv83/dbi599/ag/${VAR}_cafe-c5-d60-pX-f6_19900501-20201101_${TIME_FREQ}-${TIME_AGG}_${REGION_NAME}-${SPATIAL_AGG}_bias-corrected-awap-${BIAS_METHOD}.zarr.zip

SIMILARITY_FILE=/g/data/xv83/dbi599/ag/ks-test_${VAR}_cafe-c5-d60-pX-f6_19900501-20201101_${TIME_FREQ}-${TIME_AGG}_${REGION_NAME}-${SPATIAL_AGG}_bias-corrected-awap-${BIAS_METHOD}.zarr.zip

INDEPENDENCE_PLOT=/g/data/xv83/dbi599/ag/independence-test_${VAR}_cafe-c5-d60-pX-f6_19900501-20201101_${TIME_FREQ}-${TIME_AGG}_${REGION_NAME}-${SPATIAL_AGG}_bias-corrected-awap-${BIAS_METHOD}_region-all.png
INDEPENDENCE_LOCATION=region=all

DASK_CONFIG=config/dask_local.yml



