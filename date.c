#include<stdio.h>
#include<time.h>
#include<string.h>
int main(int argc,char *argv[])
{
	char str[]={'d','a','t','e',' ','+','%','d','\0'};
	char foryear[]={'d','a','t','e',' ','+','%','Y','\0'};

	if(strcmp(argv[1],"date")==0)
	{
		time_t t;
		time(&t);
		printf("%s",ctime(&t));
	}

	else if(strcmp(argv[1],str)==0)
	{
		time_t t;
		time(&t);
		char str_check[strlen(ctime(&t))];
		strcpy(str_check,ctime(&t));

		char *ptr;
		ptr=strtok(str_check," ");
		ptr=strtok(NULL," ");
		ptr=strtok(NULL," ");
		printf("%s\n",ptr);	
	}

	else if(strcmp(argv[1],foryear)==0)
	{
		time_t t;
		time(&t);
		char str_check[strlen(ctime(&t))];
		strcpy(str_check,ctime(&t));

		char *ptr;
		ptr=strtok(str_check," ");
		ptr=strtok(NULL," ");
		ptr=strtok(NULL," ");
		ptr=strtok(NULL," ");
		ptr=strtok(NULL," ");
		printf("%s",ptr);	
	}
	
	else
	{
		printf("\033[1;31m");
		printf("Wrong Input\n");
		printf("\033[0m");
	}
	return 0;
}