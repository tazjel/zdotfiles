function ww10
{
        cd ~/tst
    for i in $(seq 0 10);do
        mkdir $i; cd $i
        for xi in $(seq 1 100);do
            mkdir $xi
        done
    done
}

ww10
tree ~/tst
echo "done"
