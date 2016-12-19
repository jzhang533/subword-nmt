#!/bin/bash
set -ex
set -o pipefail

word_piece_number=20000
wd=nist-data-wd
pwd=$(pwd)

#cat $wd/source $wd/target | python learn_bpe.py -s $word_piece_number > $wd/share${word_piece_number}.mergeop 

#python apply_bpe.py --codes $wd/share${word_piece_number}.mergeop --input $wd/source --separator '' > $wd/source.seg${word_piece_number} 
#python apply_bpe.py --codes $wd/share${word_piece_number}.mergeop --input $wd/target --separator '' > $wd/target.seg${word_piece_number}
#cat $wd/source.seg${word_piece_number} $wd/target.seg${word_piece_number} | python get_vocab.py > $wd/share${word_piece_number}.vocab
#paste $wd/source.seg${word_piece_number} $wd/target.seg${word_piece_number} | python data_stats2.py > $wd/data_stats${word_piece_number}.txt

echo _PAD > $wd/share${word_piece_number}.lego_vocab
echo _GO >> $wd/share${word_piece_number}.lego_vocab
echo _EOS >> $wd/share${word_piece_number}.lego_vocab
echo _UNK >> $wd/share${word_piece_number}.lego_vocab

cut -f1 -d' ' $wd/share${word_piece_number}.vocab >> $wd/share${word_piece_number}.lego_vocab

mkdir $wd/results${word_piece_number}
mv  $wd/share${word_piece_number}.lego_vocab $wd/results${word_piece_number}

mv  $wd/source.seg${word_piece_number} $wd/results${word_piece_number}
mv  $wd/target.seg${word_piece_number} $wd/results${word_piece_number}

