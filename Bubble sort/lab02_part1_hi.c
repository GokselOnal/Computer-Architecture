/******** High-level C code of bubble sort (ascending order) ********/

void main() {
	
	int SIZE = 10;
	int a[SIZE] = {7, 3, 0, 6, 1, 4, 9, 8, 5, 2}; 
	int k = 0, m  = 0, tmp; 

	while (k < SIZE) {
		m = 0;
		while(m < SIZE-k-1) {
			if (a[m+1] < a[m]){
			   tmp    = a[m];
		       a[m]   = a[m+1];
		       a[m+1] = tmp;
			}
			m++;
		}
		k++;
	}
}
