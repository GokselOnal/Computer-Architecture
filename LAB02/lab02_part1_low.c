//Göksel can ÖNAL
//S011927

SIZE = 10;
a[0] = 7;   // {7, 3, 0, 6, 1, 4, 9, 8, 5, 2}; 
a[1] = 3;
a[2] = 0;
a[3] = 6;
a[4] = 1;
a[5] = 4;
a[6] = 9;
a[7] = 8;
a[8] = 5;
a[9] = 2;
k = 0;
m = 0;

WHILE1:
tmp = k;
tmp = tmp < SIZE;
if(tmp == 0) goto END_WHILE1;
m = 0;
WHILE2:
tmp2 = k;
tmp2 = -tmp2 -1;
tmp2 = tmp2 + SIZE;
tmp3 = m;
tmp3 = tmp3 < tmp2;
if(tmp3 == 0) goto END_WHILE2 + INC_k;
indx1 = a;
indx1 = indx1 + m;
arrCurrent = *indx1;
indx2 = indx1;
indx2 = indx2 + 1;
arrNext = *indx2;
arrNext = arrNext < arrCurrent;
if(arrNext == 0) goto INC_m;
tmp4 = *indx1;
tmp5 = *indx2;
*indx1 = tmp5;
*indx2 = tmp4;
goto INC_m;

INC_m:
m = m + 1
goto WHILE2;

END_WHILE2 + INC_k:
k = k + 1
goto WHILE1;

END_WHILE1:















