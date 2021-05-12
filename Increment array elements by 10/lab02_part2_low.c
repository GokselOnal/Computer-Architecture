size = 2;
a[0] = 137;
a[1] = 224;
k = 0;

WHILE:
tmp = k;
tmp = tmp < size;
if(tmp = 0) goto END_WHILE;
tmp2 = *(a+k);
tmp2 = tmp2 + 10;
*(a+k) = tmp2;
k = k + 1;
goto WHILE:
END_WHILE: goto END_WHILE;
