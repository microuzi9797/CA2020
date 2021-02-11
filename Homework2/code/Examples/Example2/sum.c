#include <stdio.h>

int sum(int, int, int);

int main () {
	int a = 123, b = 456, c = 789;
	printf("%d + %d + %d = %d\n", a, b, c, sum(a, b, c));
}
