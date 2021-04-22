//Göksel can ÖNAL
//S011827

0: CPi 300 1    // index = 1
1: CPI 200 400  // max = arry[0]
2: CPi 285 0    // maxIndex = 0
3: CP 151 300   // tmp = index
4: LT 151 90    // tmp = tmp < SIZE
5: BZJ 25 151   // if(tmp == 0) goto END_WHILE1
6: CP 152 200   // tmp2 = max
7: CP 250 300   // tmpT = index
8: ADD 250 400  // tmpT = tmpT + arry
9: CPI 153 250  // tmp3 = *tmpT
10: LT 152 153  // tmp2 = tmp2 < tmp3
11: BZJ 30 152  // if(tmp2 == 0) goto END_IF
12: CPI 200 250 // max = *tmpT
13: CP 285 300
14: ADDi 300 1
15: BZJi 31 0
16: BZJi 17 0
17: 16


25: 16

30: 14
31: 3


90: 25    // SIZE

100: 19   // first element of array 
101: 13   
102: 22
103: 43
104: 35
105: 67
106: 58
107: 79
108: 18
109: 26
110: 33
111: 41
112: 51
113: 60
114: 81
115: 59
116: 63
117: 77
118: 83
119: 33
120: 44
121: 12
122: 99
123: 22
124: 21   // last element of array

151: 0//tmp
152: 0//tmp2
153: 0//tmp3

200: 0//max

250: 0//tmpT

285: 0    //found greatest index

400: 100 // arry 
