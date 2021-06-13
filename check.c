#include <stdio.h>
#include <string.h>
int main()
{
	char ch[20];
	scanf("%s",ch);
	if(strcmp(ch,"'\n'")==0)
	{
		char st='\\';
		printf("%c \n",st);
	}
	return 0;
}