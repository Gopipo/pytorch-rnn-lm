# Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

Original repo at https://github.com/bricksdont/pytorch-rnn-lm

# Changes made:

- ./scripts/download_data.sh  >  ./scripts/download_data_cookbook.sh
- ammended ./scripts/train.sh to fit new names
- ammended ./scripts/generate.sh to fit new names
- added new rules to preprocessed_raw.py (lines 8-13)

Results at 5000 vocabulary size, 0.5 dropout:

|emsize| test ppl \n
| 150  | 163.00 | \n
| 200  | 161.75 | \n
| 225  | 163.96 | \n
| 230  | 155.71 | \n
| **240**  | **153.23** | \n
| 250  | 153.96 | \n
| 260  | 156.40 | \n
| 275  | 157.26 | \n
| 300  | 154.48 | \n
| 320  | 173.87 | \n
| 350  | 156.64 | \n
| 375  | 160.92 | \n
| 400  | 158.42 | \n
| 450  | 158.69 | \n
| 500  | 160.23 | \n

# Sample:
 
. <eos> Large length of GLACÉ ° . Canned with <eos> egg PICKLES without crystals while them only out to
make sometimes , <eos> leave them <unk> wrap as expose all paper . <eos> Individual creams may be served in
<unk> . <eos> 6 rind is of Sift like noyau depends than highly <eos> If a Brown citron or so
way so tartar from a CANNING luncheons very sprinkled <eos> to be brine stronger from them or best , which
can be <eos> put in butter ; <eos> in three or a few paper , but it has no gathered


# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/Gopipo/pytorch-rnn-lm
    cd pytorch-rnn-lm

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data_cookbook.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh
