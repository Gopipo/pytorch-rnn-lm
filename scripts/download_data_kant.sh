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

# download Kant's "Kritik der reinen Vernunft"

mkdir -p $data/kant

mkdir -p $data/kant/raw

wget http://www.gutenberg.org/cache/epub/6343/pg6343.txt
mv pg6343.txt $data/kant/raw

#remove English head and tail

sed -n '51, 21483p' $data/kant/raw/pg6343.txt > $data/kant/raw/pg6343.cut.txt

# preprocess slightly

cat $data/kant/raw/pg6343.cut.txt | python $base/scripts/preprocess_raw.py > $data/kant/raw/pg6343.cleaned.txt

# tokenize, fix vocabulary upper bound
# changed language to German

cat $data/kant/raw/pg6343.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 8000 --tokenize --lang "de" > \
    $data/kant/raw/pg6343.preprocessed.txt

# split into train, valid and test

head -n 500 $data/kant/raw/pg6343.preprocessed.txt > $data/kant/valid.txt
head -n 1000 $data/kant/raw/pg6343.preprocessed.txt | tail -n 500 > $data/kant/test.txt
tail -n 3260 $data/kant/raw/pg6343.preprocessed.txt > $data/kant/train.txt
