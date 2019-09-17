#include<stdio.h>

extern int add(int a, int b);
extern int sub(int a, int b);
extern int mul(int a, int b);
extern int div(int a, int b);
extern int rem(int a, int b);

void main(){
	printf("Welcome to the calculator.\n");
	printf("Type an operation to add, sub, div, or mul\n");

	int num_1, num_2, result;
	char op, sent;

	do{
		printf("\nEnter operation: ");		

		scanf("%d %c %d", &num_1, &op, &num_2);

		switch(op){
			case '+': result = add(num_1, num_2);
				  printf("\t= %d\n", result);
				  break;
			case '-': result = sub(num_1, num_2);
				  printf("\t= %d\n", result);
				  break;
			case '*': result = mul(num_1, num_2);
				  printf("\t= %d\n", result);
				  break;
			case '/': result = num_1 < 0 ? (num_2 < 0 ? div(-num_1, -num_2) : -1 * div(-num_1, num_2)) : (num_2 < 0 ? -1 * div(num_1, -num_2) : div(num_1, num_2));
				  printf("\t= %d", result);
				  result = num_1 < 0 ? (num_2 < 0 ? rem(-num_1, -num_2) : rem(-num_1, num_2)) : (num_2 < 0 ? rem(num_1, -num_2) : rem(num_1, num_2));
				  printf(" with remainder %d\n", result);
				  break;
			default:  printf("Please enter a valid operation:\n\t+ for addition\n\t- for subtraction\n\t* for multiplication\n\t/ for division\n"); break;
		}

		printf("\nContinue? Y/N    ");
		scanf(" %c", &sent);
	} while (sent == 'Y' || sent == 'y');

	printf("Thanks for using the calculator.\n");
}