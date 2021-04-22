350: 400 // stackPtr = *350
500: 0   // lastresult
	     
400: 8   // stack
401: 0   // return_val
402: 2   // return_addr

stack[ptr] = n;     // stack
stack[ptr + 1] = 0; // return_val
stack[ptr + 2] = 2; // return_addr

TOP:
	
    if (stack[ptr] <= 1)
    {
        lastresult = stack[ptr];
        ptr = ptr - 3;
		goto stack[ptr+5];
    }
    
    stack[ptr+3] = stack[ptr] - 1;
    stack[ptr+4] = 0;
    stack[ptr+5] = RETURNpt1;
    ptr = ptr + 3;
    goto TOP;

RETURNpt1:

    stack[ptr + 1] = lastresult;
    stack[ptr + 3] = stack[ptr] - 2;
    stack[ptr + 4] = 0;
    stack[ptr + 5] = RETURNpt2;
    ptr = ptr + 3;
    goto TOP;

RETURNpt2:

    lastresult += stack[ptr + 1];
    ptr = ptr - 3;
	goto stack[ptr+5];

END: goto END
