0: CPi 300 0    // i = 0
1: CP 100 300   // tmp = i
2: LT 100 101   // tmp = tmp < size
3: BZJ 16 100   // goto END
4: CP 100 300   // tmp = i
5: ADDi 100 400 // tmp = aa + tmp
6: CPIi 100 50  // *tmp = 0
7: ADDi 50 1    // value++
8: ADDi 300 1   // i++
9: BZJi 15 0
10: BZJi 11 0
11: 10

15: 1
16: 10

50: 0 // value

100: 0 // tmp
101: 5 // size

200: 400 //aa