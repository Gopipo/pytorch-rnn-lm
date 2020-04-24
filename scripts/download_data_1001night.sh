#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download 1001night's "Kritik der reinen Vernunft"

mkdir -p $data/1001night

mkdir -p $data/1001night/raw

wget https://www.gutenberg.org/files/34206/34206-0.txt
mv 34206-0.txt $data/1001night/raw

#remove head and tail

sed -n '1367, 24959p' $data/1001night/raw/34206-0.txt > $data/1001night/raw/34206-0.cut.txt

# preprocess slightly

cat $data/1001night/raw/34206-0.cut.txt | python $base/scripts/preprocess_raw.py > $data/1001night/raw/34206-0.cleaned.txt

# tokenize, fix vocabulary upper bound
# changed upper bound to 10000

cat $data/1001night/raw/34206-0.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" > \
    $data/1001night/raw/34206-0.preprocessed.txt

# split into train, valid and test

head -n 500 $data/1001night/raw/34206-0.preprocessed.txt > $data/1001night/valid.txt
head -n 1000 $data/1001night/raw/34206-0.preprocessed.txt | tail -n 500 > $data/1001night/test.txt
tail -n 3260 $data/1001night/raw/34206-0.preprocessed.txt > $data/1001night/train.txt
