//Göksel can ÖNAL
//S011827

0: CP 100 101   // tmp = k
1: LT 100 102   // tmp = tmp < size
2: BZJ 51 100   // if(tmp = 0) goto END_WHILE;
3: CP 104 101   // tmp3 = k
4: ADD 104 300  // tmp3 = tmp3 + a
5: CPI 103 104  // tmp2 = *(a + k)
6: ADDi 103 10  // tmp2 = tmp2 + 10
7: CPIi 104 103 // *(a + k) = tmp2
8: ADDi 101 1   // k++
9: BZJi 50 0    // jump to 0
10: BZJi 11 0   //END_WHILE
11: 10


50: 0
51: 10

100: 0 //tmp
101: 0 //k
102: 2 //size
103: 0 //tmp2
104: 0 // tmp3

300: 400 //a


400: 137
401: 224