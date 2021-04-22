index = 1;
max = arry[0];
maxIndex = 0;

WHILE1:
tmp = index;
tmp = tmp < SIZE;
if(tmp == 0) goto END_WHILE1;
tmp2 = max;
tmp3 = arry[index];
tmp2 = tmp2 < tmp3;
if(tmp2 == 0) goto END_IF;
max = arry[index];
maxIndex = index;
END_IF:
index = index + 1;
goto WHILE1;
END_WHILE1: goto END_WHILE1;
