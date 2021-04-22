//This program is the low level of lab01_part2_max3_hi.c
max = a;
tmp = a;
tmp = tmp < b;
if(tmp == 0) goto SKIP;
	max = b;
SKIP: tmp = max;
tmp = max < c;
if(tmp == 0) goto END;
	max = c;
END: