./xmlchange --force BLOM_OUTPUT_SIZE=spinup

./xmlchange --force HAMOCC_OUTPUT_SIZE=spinup

#!/bin/bash

set -e

# Created 2025-10-10 15:48:47

CASEDIR="/cluster/work/users/kjetisaa/n1850.ne16pg3_tn14.hybrid_fates-nocomp.noresm3_0_beta03a.2025-10-10"

/cluster/work/users/kjetisaa/NorESM_3_0_beta03a/cime/scripts/create_newcase --case "${CASEDIR}" --compset 1850_CAM70%LT%NORESM%CAMoslo_CLM60%FATES-NOCOMP_CICE_BLOM%HYB%ECO_MOSART_DGLC%NOEVOLVE_SWAV_SESP --res ne16pg3_tn14 --project nn9560k --machine betzy --compiler intel --run-unsupported --user-mods-dir /cluster/work/users/kjetisaa/NorESM_3_0_beta03a/cime_config/usermods_dirs/reduced_out_devsim/

cd "${CASEDIR}"

./xmlchange NTASKS=1536,NTASKS_OCN=500,NTASKS_ICE=768,NTASKS_LND=768,ROOTPE_OCN=1536,ROOTPE_LND=768

./xmlchange RUN_TYPE=branch

./xmlchange RUN_STARTDATE=0061-01-01,START_TOD=00000

./xmlchange RUN_REFCASE=n1850.ne16_tn14.noresm3_0_beta03_rafsipmasstonum.20250930

./xmlchange RUN_REFDATE=0061-01-01,RUN_REFTOD=00000

./xmlchange GET_REFCASE=FALSE

./xmlchange DRV_RESTART_POINTER=rpointer.cpl.0061-01-01-00000

./xmlchange STOP_OPTION=nyears

./xmlchange STOP_N=5

./xmlchange REST_N=5

./xmlchange RESUBMIT=4

./xmlchange REST_OPTION=nyears

./xmlchange DATA_ASSIMILATION_SCRIPT=/cluster/work/users/kjetisaa/NorESM_3_0_beta03a/tools/rerun_noresm.py

./xmlchange DATA_ASSIMILATION_CYCLES=2

./xmlchange --subgroup case.run JOB_WALLCLOCK_TIME=48:00:00

./xmlchange --subgroup case.st_archive JOB_WALLCLOCK_TIME=2:00:00

./xmlchange --subgroup case.compress JOB_WALLCLOCK_TIME=12:00:00

./case.setup

./case.build

./case.submit

./case.submit

./xmlchange RESUBMIT=10

./case.submit

./xmlchange --subgroup case.run JOB_WALLCLOCK_TIME=24:00:00

./case.submit

./case.submit

./case.submit

