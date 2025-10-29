./xmlchange --force BLOM_OUTPUT_SIZE=spinup

./xmlchange --force HAMOCC_OUTPUT_SIZE=spinup

#!/bin/bash

set -e

# Created 2025-10-23 15:52:43

CASEDIR="/cluster/projects/nn9560k/tomast/NorESM/cases/n1850.ne30_tn14.noresm3_0_beta03b-run2_yr001.20251023"

/cluster/projects/nn9560k/tomast/NorESM/src/noresm3_0_beta03b/cime/scripts/cime/scripts/create_newcase --case "${CASEDIR}" --compset 1850_CAM70%LT%NORESM%CAMoslo_CLM60%FATES_CICE_BLOM%HYB%ECO_MOSART_DGLC%NOEVOLVE_SWAV_SESP --res ne30pg3_tn14 --project nn9560k --machine betzy --compiler intel --run-unsupported --user-mods-dir /cluster/projects/nn9560k/tomast/NorESM/src/noresm3_0_beta03b/cime_config/usermods_dirs/reduced_out_devsim/

cd "${CASEDIR}"

./case.setup

./xmlchange STOP_OPTION=nyears

./xmlchange STOP_N=5

./xmlchange REST_N=1

./xmlchange REST_OPTION=nyears

./xmlchange RESUBMIT=1

./xmlchange DATA_ASSIMILATION_SCRIPT=/cluster/projects/nn9560k/tomast/NorESM/src/noresm3_0_beta03b/tools/rerun_noresm.py

./xmlchange DATA_ASSIMILATION_CYCLES=3

./xmlchange --subgroup case.run JOB_WALLCLOCK_TIME=72:00:00

./xmlchange --subgroup case.st_archive JOB_WALLCLOCK_TIME=3:00:00

./xmlchange --subgroup case.compress JOB_WALLCLOCK_TIME=18:00:00

./case.build

./case.submit

./xmlchange RESUBMIT=1

