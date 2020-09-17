#include <stdio.h>
#include <stdlib.h>

int main()
{
	printf("----------begin----------\n");	

	const char *pcommand = "ps > ps.txt";
	const char *pcommand2 = "./demon";
	int ret = system(pcommand); // child process
	printf("[%s] [%d]\n", pcommand, ret);
	ret = system(pcommand2);
	printf("[%s] [%d]\n", pcommand2, ret);

	printf("----------end----------\n");	
	return 0;
}
