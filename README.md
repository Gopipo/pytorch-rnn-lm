# Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

Original repo at https://github.com/bricksdont/pytorch-rnn-lm

# Changes made:

- ./scripts/download_data.sh  >  ./scripts/download_data_cookbook.sh
- ammended ./scripts/train.sh to fit new names
- ammended ./scripts/generate.sh to fit new names
- added new rules to preprocessed_raw.py (lines 8-13)

Results at 5000 vocabulary size, 0.5 dropout:

|emsize| test ppl

| 150  | 163.00 |

| 200  | 161.75 |

| 225  | 163.96 |

| 230  | 155.71 |

| **240**  | **153.23** | **best result**

| 250  | 153.96 |

| 260  | 156.40 |

| 275  | 157.26 |

| 300  | 154.48 |

| 320  | 173.87 |

| 350  | 156.64 |

| 375  | 160.92 |

| 400  | 158.42 |

| 450  | 158.69 |

| 500  | 160.23 |

# Sample:
 
. <eos> No. 4 . Press one half peck of different fruit apples ( adding chopped <unk> Do <eos> is
dry ° , and leave them in a angel course or stirring as desired or <eos> browned . Do not
place in a slack oven less <eos> browned . Drop a liquor &apos;s <unk> if place add a cupful of
<eos> cream into a saucepan until dice ; flavored in the center or West <eos> too soft . <eos> =
CAFÉ ICE-CREAM = <eos> Take to ten and the éclairs of the center , the iron it on the mold



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
