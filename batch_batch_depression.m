

for bbDp=1:9
    bbDp
    save bbdp.mat bbDp
    clear all
    load bbdp.mat
    batch_depression
end