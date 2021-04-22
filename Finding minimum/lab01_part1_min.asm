0: CP 200 101 // min = x
1: CP 201 102 // tmp = y
2: LT 201 101 // tmp = tmp < x
3: BZJ 6 201 // if(tmp == 0) goto END
4: CP 200 102 // min = y
5: BZJi 6 0  // END:
6: 5

101: 500 // x
102: 522 // y

200: 0 //min
201: 0 //tmp
