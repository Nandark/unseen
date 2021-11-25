# Configuration for SeaTac airport annual maximum temperture analysis

VAR=tasmax
UNITS=${VAR}=C
LAT=47.45
LON=237.69
REGION_NAME=seatac
TIME_FREQ=A-DEC
TIME_AGG=max
BIAS_METHOD=additive
BASE_PERIOD=1995-01-01 2021-12-31

CONFIG_DIR=/home/599/dbi599/unseen/config
SEATAC_DIR=/g/data/xv83/dbi599/seatac

DASK_CONFIG=${CONFIG_DIR}/dask_local.yml

GENERAL_IO_OPTIONS=--variables ${VAR} --time_freq ${TIME_FREQ} --time_agg ${TIME_AGG} --units ${UNITS}
FCST_IO_OPTIONS=${GENERAL_IO_OPTIONS} --spatial_coords ${LAT} ${LON} --complete_time_agg_periods
OBS_IO_OPTIONS=${GENERAL_IO_OPTIONS} --input_freq D 

FCST_DATA_1990S := $(sort $(wildcard /g/data/xv83/dcfp/CAFE-f6/c5-d60-pX-f6-199[5,6,7,8,9]*/atmos_isobaric_daily.zarr.zip))
FCST_DATA_2000S := $(sort $(wildcard /g/data/xv83/dcfp/CAFE-f6/c5-d60-pX-f6-2*/atmos_isobaric_daily.zarr.zip))
FCST_DATA := ${FCST_DATA_1990S} ${FCST_DATA_2000S}
FCST_HOT_DAY_DATA = /g/data/xv83/dcfp/CAFE-f6/c5-d60-pX-f6-20110501/atmos_isobaric_daily.zarr.zip
FCST_METADATA=${CONFIG_DIR}/dataset_cafe_daily.yml
FCST_ENSEMBLE_FILE=${SEATAC_DIR}/data/${VAR}_cafe-c5-d60-pX-f6_19950501-20201101_${TIME_FREQ}-${TIME_AGG}_${REGION_NAME}.zarr.zip
FCST_CONFIG=${CONFIG_DIR}/dataset_cafe_daily.yml

OBS_DATA=${SEATAC_DIR}/data/tasmax_GHCNv2_SeaTac_daily_1948-2021.nc
OBS_METADATA=${CONFIG_DIR}/dataset_knmi_daily.yml
OBS_PROCESSED_FILE=${SEATAC_DIR}/data/${VAR}_GHCNv2_1948-2021_${TIME_FREQ}-${TIME_AGG}_${REGION_NAME}.zarr.zip

FCST_BIAS_FILE=${SEATAC_DIR}/data/${VAR}_cafe-c5-d60-pX-f6_19950501-20201101_${TIME_FREQ}-${TIME_AGG}_${REGION_NAME}_bias-corrected-GHCNv2-${BIAS_METHOD}.zarr.zip

REANALYSIS_HGT_FILE=${SEATAC_DIR}/data/h500_ERA5_hourly_2021-06-28.grib
REANALYSIS_TAS_FILE=${SEATAC_DIR}/data/tas_ERA5_hourly_2021-06-28.grib

TXX_HISTOGRAM_PLOT=${SEATAC_DIR}/figures/txx_histogram_seatac.pdf
REANALYSIS_HOT_DAY_PLOT=${SEATAC_DIR}/figures/seatac_2021-06-28_era5.pdf
MODEL_HOT_DAY_PLOT=${SEATAC_DIR}/figures/seatac_hottest_day_cafe.pdf
TXX_SAMPLE_PLOT=${SEATAC_DIR}/figures/txx_samples_seatac.pdf
TXX_LIKELIHOOD_PLOT=${SEATAC_DIR}/figures/txx_likelihoods_seatac.pdf
TXX_RETURN_PERIODS_PLOT=${SEATAC_DIR}/figures/model_return_periods_seatac.pdf
TXX_ANNUAL_MAX_PLOT=${SEATAC_DIR}/figures/model_annual_max_seatac.pdf
TXX_ANNUAL_DIST_PLOT=${SEATAC_DIR}/figures/model_annual_distribution_seatac.pdf
