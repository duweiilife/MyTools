# Create by DuWei 2017-5

#!/bin/bash
nj=20

for f in wav_vad_50w_speedup.scp
do
    [ ! -d tmp ] && rm -r tmp
    mkdir tmp
    scp="" 
    for i in `seq $nj`
    do
        scp=`echo "$scp tmp/$i.$f"`
    done
    ./split_scp.pl $f $scp 
       
    for i in `seq $nj`
    do
        {
        python cut_wav.py tmp/$i.$f
        } &
    done
    wait
    rm -r tmp
    echo "Cut data success for $f!"
done
