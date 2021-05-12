//Göksel can ÖNAL	
//S011827

0: CP 50 200    // *50 = k   WHILE1
1: LT 50 300    // if(k < SIZE)
2: BZJ 80 50    // PC++  (continue to loop or break)
3: CPi 201 0    // m = 0
4: CP 40 200    // *40 = k   WHILE2 
5: NAND 40 40   // -k-1
6: ADD 40 300   // SIZE-k-1
7: CP 60 201    // *60 = m
8: LT 60 40     // if(m < SIZE-k-1)
9: BZJ 81 60    // PC++ (continue to loop or break)

10: CP 36 89   // *36 = a 
11: ADD 36 201  // *36 = a+m
12: CPI 37 36   // *37 = *(a+m)
13: CP 39 36    // *39 = a+m
14: ADDi 39 1   // *39 = a+m+1
15: CPI 38 39   // *38 = *(a+m+1)
16: LT 38 37   // (*(a+m+1) < *(a+m))
17: BZJ 83 38   // if (*(a+m+1) < *(a+m)) goto INC_m;
18: CPI 97 36   // *97 = *(a+m) 
19: CPI 98 39   // *98 = *(a+m+1)
20: CPIi 36 98   // *(a+m) = *98
21: CPIi 39 97    // *(a+m+1) = *97
22: BZJi 83 0   // jump to 55

55: ADDi 201 1  // INC_m
56: BZJi 82 4   // goto WHILE2

70: ADDi 200 1  // END_WHILE2 + INC_k
71: BZJi 82 0   // goto WHILE1

80: 2
81: 70
82: 0
83: 55

89: 301         // a (start address of array)
90: 0           // tmp_while_1
91: 0           // tmp_while_2
92: 0           // tmp_while_2_1

97: 0           // tmp_val_1
98: 0           // tmp_val_2

130: BZJi 131 0 // END_WHILE1, also end of program
131: 130

200: 0          // k 
201: 0          // m

300: 10         // SIZE
301: 7          // first element of array 
302: 3   
303: 0
304: 6
305: 1
306: 4
307: 9
308: 8
309: 5
310: 2          // last element of array
