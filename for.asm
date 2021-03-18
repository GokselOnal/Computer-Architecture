0: CPi 100 0    // ii = 0;
1: CP 101 100   // tmp = ii;
2: LT 101 102   // tmp = tmp < NN;
3: BZJ 14 101   // if(tmp == 0) goto SKIP;
4: 200          // A;
5: ADDi 100 1   // ii++
6: BZJi 15 0    // goto BEGIN;
7: 201          // SKIP;
8: BZJi 9 0     
9: 8     

14: 7
15: 1

100: 0  //ii
101: 0  //tmp
102: 10 //NN
103: 7
104: 1

200: 10
201: 11