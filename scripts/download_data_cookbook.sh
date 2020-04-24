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

# download cookbook's "Kritik der reinen Vernunft"

mkdir -p $data/cookbook

mkdir -p $data/cookbook/raw

wget http://www.gutenberg.org/cache/epub/22790/pg22790.txt
mv pg22790.txt $data/cookbook/raw

#remove head and tail

sed -n '37, 18718p' $data/cookbook/raw/pg22790.txt > $data/cookbook/raw/pg22790.cut.txt

# preprocess slightly

cat $data/cookbook/raw/pg22790.cut.txt | python $base/scripts/preprocess_raw.py > $data/cookbook/raw/pg22790.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/cookbook/raw/pg22790.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 4000 --tokenize --lang "en" > \
    $data/cookbook/raw/pg22790.preprocessed.txt

# split into train, valid and test

head -n 500 $data/cookbook/raw/pg22790.preprocessed.txt > $data/cookbook/valid.txt
head -n 1000 $data/cookbook/raw/pg22790.preprocessed.txt | tail -n 500 > $data/cookbook/test.txt
tail -n 3260 $data/cookbook/raw/pg22790.preprocessed.txt > $data/cookbook/train.txt
