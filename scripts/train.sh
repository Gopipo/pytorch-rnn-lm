#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=8
device=""

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/cookbook \
        --model LSTM --epochs 30 \
        --emsize 175 --nhid 175 --dropout 0.5 --tied \
        --save $models/model.pt
)

echo "time taken:"
echo "$SECONDS seconds"
