#!/bin/bash

set -e

python3 /home/tk/Code/COW/src/csvw_tool.py convert --format nquads $1
#python3 /home/tk/Code/COW/src/csvw_tool.py convert --format trig $1

cat $1.table.nq $1.nq > $1.full.nq
np op filter -o $1.trig.pre $1.full.nq
cat prefixes.trig $1.trig.pre > $1.trig
np mktrusty -r -o $1.trusty.trig $1.trig
np check $1.trusty.trig
np html -s $1.trusty.trig > $1.trusty.trig.html

rm $1*.nq $1.trig.pre $1.trig
