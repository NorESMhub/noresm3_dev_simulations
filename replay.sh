#!/bin/bash

set -e

# Created 2024-11-11 21:21:30

CASEDIR="/cluster/work/users/kjetisaa/n1850.ne30_tn14.hybrid_fatessp.20241111"

/cluster/work/users/kjetisaa/NorESM_alpha07_fatessp_newradiation/cime/scripts/create_newcase --case /cluster/work/users/kjetisaa//n1850.ne30_tn14.hybrid_fatessp.20241111 --compset 1850_CAM%DEV%LT%NORESM%CAMoslo_CLM60%FATES-SP_CICE_BLOM%ECO_MOSART_DGLC%NOEVOLVE_SWAV_SESP --res ne30pg3_tn14 --project nn9039k --run-unsupported --mach betzy

cd "${CASEDIR}"

./xmlchange NTASKS=1920

./xmlchange NTASKS_OCN=256

./xmlchange ROOTPE=0

./xmlchange ROOTPE_OCN=1920

./xmlchange BLOM_VCOORD=cntiso_hybrid,BLOM_TURBULENT_CLOSURE=

./xmlchange STOP_OPTION=nyears

./xmlchange STOP_N=7

./xmlchange REST_N=1

./xmlchange REST_OPTION=nyears

./xmlchange RESUBMIT=3

./xmlchange --subgroup case.run JOB_WALLCLOCK_TIME=48:00:00

./xmlchange --subgroup case.st_archive JOB_WALLCLOCK_TIME=03:00:00

./case.setup

./case.build

./case.build

./case.submit

