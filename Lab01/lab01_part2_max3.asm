0: CP 200 101 // max = a
1: CP 201 101 // tmp = a
2: LT 201 102 // tmp = tmp < b
3: BZJ 10 201 // if(tmp == 0) goto SKIP
4: CP 200 102 // max = b
5: CP 201 200 // SKIP: tmp = max
6: LT 201 103 // tmp = tmp < c
7: BZJ 11 201 // if(tmp2 == 0) goto END
8: CP 200 103 // max = c
9: BZJi 11 0 // END:
10: 5
11: 9

101: 550 //a
102: 500 //b
103: 525 //c

200: 0 //max 
201: 0 //tmp
