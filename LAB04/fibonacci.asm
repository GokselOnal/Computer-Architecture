// Göksel can ÖNAL
// S011827

0: CPi 400 8 // n = 8 or Fib(8)
1: BZJi 50 0 // go to first instruction of the function
2: BZJi 3 0  // END
3: 2

50: 100 

289: 2
290: 1
291: 0
292: 0xFFFFFFFD // = -3
293: 0xFFFFFFFE // = -2
294: 0xFFFFFFFF // = -1
295: 136 // RETURNpt2
296: 120 // RETURNpt1
297: 109 // SKIP
298: 100 // TOP

350: 400 // ptr = *350

390: 0   // tmp0
391: 0   // tmp1
392: 0   // tmp2

400: 0   // stack
401: 0   // return_val
402: 2   // return_addr
     
500: 0   // lastresult

// TOP:
100: CPI 390 350  // tmp0 = stack[ptr];
101: LTi 390 2    // if (stack[ptr] <= 1)
102: BZJ 297 390  // goto SKIP
103: CPI 500 350  // lastresult = stack[ptr];
104: ADD 350 292  // ptr = ptr - 3;
105: CP 390 350   // tmp0 = ptr
106: ADDi 390 5   // tmp0 = ptr + 5
107: CPI 392 390  // tmp2 = stack[ptr+5]
108: BZJi 392 0   // goto stack[ptr+5];

// SKIP:
109: CPI 390 350  // tmp0 = stack[ptr]
110: ADD 390 294  // tmp0 = stack[ptr] - 1;
111: CP 392 350   // tmp2 = ptr;
112: ADDi 392 3   // tmp2 = ptr + 3
113: CPIi 392 390 // stack[ptr+3] = stack[ptr] - 1;
114: ADDi 392 1   // tmp2 = ptr + 4
115: CPIi 392 291 // stack[ptr+4] = 0;
116: ADDi 392 1   // tmp2 = ptr + 5
117: CPIi 392 296 // stack[ptr+5] = RETURNpt1;
118: ADDi 350 3   // ptr = ptr + 3;
119: BZJi 298 0   // goto TOP;

// RETURNpt1:
120: CP 390 350   // tmp0 = ptr
121: ADDi 390 1   // tmp0 = ptr + 1
122: CPIi 390 500 // stack[ptr + 1] = lastresult
123: ADDi 390 2   // tmp0 = ptr + 3
124: CPI 391 350  // tmp1 = stack[ptr]
125: ADD 391 293  // tmp1 = stack[ptr] - 2
126: CPIi 390 391 // stack[ptr + 3] = stack[ptr] - 2
127: ADDi 390 1   // tmp0 = ptr + 4
128: CPIi 390 291 // stack[ptr + 4] = 0
129: ADDi 390 1   // tmp0 = ptr + 5
130: CPIi 390 295 // stack[ptr + 5] = RETURNpt2
131: ADDi 350 3   // ptr = ptr +3
132: BZJi 298 0  // goto TOP 


// RETURNpt2:
136: CP 390 350   // tmp0 = ptr
137: ADDi 390 1   // tmp0 = ptr + 1
138: CPI 391 390  // tmp1 = stack[ptr + 1]
139: ADD 500 391  // lastresult += stack[ptr + 1]
140: ADD 350 292  // ptr = ptr - 3
141: ADDi 390 1   // tmp0 = ptr + 5
142: CPI 391 390  // tmp2 = stack[ptr + 5]
143: BZJi 391 0   // goto stack[ptr+5] 


