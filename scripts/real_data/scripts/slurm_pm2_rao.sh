#! /bin/bash

source activate minorswing
cd $SLURM_SUBMIT_DIR

filename=`cat .files_rao | tail -n +${SLURM_ARRAY_TASK_ID} | head -1`
python infer_structures_pm2.py $filename \
  --seed $SEED
python select_best_pm2.py $filename