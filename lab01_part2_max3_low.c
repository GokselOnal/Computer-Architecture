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