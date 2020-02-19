wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/yuhong/2019 summer/files/LAB1/src/booth.fsdb}
wvSelectGroup -win $_nWave1 {G1}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/booth_tb"
wvGetSignalSetScope -win $_nWave1 "/booth_tb/booth"
wvExit
