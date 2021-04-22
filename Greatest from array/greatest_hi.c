void main() {
	
	int SIZE = 25;
	int arry[SIZE] = {19,13,22,43,35,67,58,79,18,26,33,41,51,60,81,59,63,77,83,33,44,12,99,22,21};
	int max = arry[0];
	int maxIndex = 0;
	int index = 1;
	
	while (index < SIZE) {
		if (max < arry[index]) {
			max = arry[index]
			maxIndex = index;
		}
		index ++
	}
	
}
