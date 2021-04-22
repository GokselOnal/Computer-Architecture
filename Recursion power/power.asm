// Göksel can ÖNAL
// S011827

0: CP 200 300
1: CP 600 301
2: CP 201 600
3: BZJi 50 0 
4: BZJi 5 0  
5: 4

50: 400 
300: 3 // base
301: 5 // exp

250: 600 // stackPtr

289: 2
290: 1
291: 0
292: 0xFFFFFFFD // = -3
293: 0xFFFFFFFE // = -2
294: 0xFFFFFFFF // = -1

296: 420 // RETURNpt1
297: 409 // SKIP
298: 400 // TOP

390: 0   // tmp0
391: 0   // tmp1
392: 0   // tmp2

600: 0   // stack
601: 0   // return_val
602: 4   // return_addr

400: CPI 390 250 // tmp0 = stack[stackPtr]
401: LTi 390 1   // tmp0 = stack[stackPtr] < 1
402: BZJ 297 390 // if(tmp0 == 0) goto SKIP
403: CP 500 290  // lastresult = 1
404: ADD 250 292 // stackPtr = stackPtr - 3
405: CP 390 250  // tmp0 = stackPtr
406: ADDi 390 5  // tmp0 = stackPtr + 5
407: CPI 392 390 // tmp2 = stack[stackPtr + 5]
408: BZJi 392 0  // goto stack[stackPtr + 5]

//SKIP:
409: CPI 390 250  // tmp0 = stack[stackPtr]
410: ADD 390 294  // tmp0 = stack[stackPtr] - 1;
411: CP 392 250   // tmp2 = stackPtr;
412: ADDi 392 3   // tmp2 = stackPtr + 3
413: CPIi 392 390 // stack[stackPtr + 3] = stack[stackPtr] - 1;
414: ADDi 392 1   // tmp2 = stackPtr + 4
415: CPIi 392 291 // stack[stackPtr + 4] = 0;
416: ADDi 392 1   // tmp2 = stackPtr + 5
417: CPIi 392 296 // stack[stackPtr + 5] = RETURNpt1;
418: ADDi 250 3   // stackPtr = stackPtr + 3;
419: BZJi 298 0   // goto TOP;

// RETURNpt1:
420: CP 390 250   // tmp0 = ptr
421: ADDi 390 1   // tmp0 += 1
422: MULT 500 300 // lastresult *= tmp0
423: CPIi 390 500 // stack[stackPtr + 1] = lastresult
424: ADD 250 292  // stackPtr = stackPtr - 3
425: ADDi 390 1   // tmp0 = stackPtr + 5
426: CPI 391 390  // tmp1 = stack[stackPtr + 5]
427: BZJi 391 0   // goto stack[stackPtr + 5]

