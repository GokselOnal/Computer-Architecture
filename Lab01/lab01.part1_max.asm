0: CP 200 101 // max = x
1: CP 201 101 // tmp = x
2: LT 201 102 // tmp = tmp < y
3: BZJ 6 201 // if(tmp == 0) goto END
4: CP 200 102 // max = y
5: BZJi 6 0  // END:
6: 5

101: 500 // x
102: 522 // y

200: 0 // max
201: 0 //tmp
