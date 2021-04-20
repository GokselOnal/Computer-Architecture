// Göksel can ÖNAL
// S011827

// *100 = (*101) x (*102)

0: CPi 100 0    // result = 0
1: BZJ 106 102  // if(*102 == 0) goto END
2: CP 103 102   // tmp = *102
3: NANDi 103 1  // tmp = ~(*103 & 1)
4: NAND 103 103 // tmp = ~(*103 & *103)
5: BZJ 105 103  // if(*103 == 0) goto SRLi1
6: ADD 100 101  // result = result + *101
7: SRLi 102 1   // *102 shifts 1 right
8: SRLi 101 33  // *101 shifts 1 left
9: BZJi 104 0   // goto BEGIN 
10: BZJi 11 0   // END
11: 10

101: 3//a
102: 60//b
103: 0//tmp 
104: 1
105: 7
106: 10
300: 0//ii 