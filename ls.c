#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<sys/dir.h>

// extern int alphacasesort();
int main(int argc,char *argv[])
{
	char variable[strlen(argv[1])];
	strcpy(variable,argv[1]);

	if(strcmp(variable,"ls -1")==0)
	{
		struct dirent **files;
		char pathName[100];
		int count,i;

		getcwd(pathName,sizeof(pathName));
		count=scandir(pathName, &files,NULL,alphasort);

		printf("\033[0;33m");
		for(i=0;i<count;i++)
		{	
			char str[100];
			strcpy(str,files[i]->d_name);
			if(strcmp(str,".")!=0 && strcmp(str,"..")!=0 && files[i]->d_name[0]!='.')
			{
				printf("%s\n",files[i]->d_name);
			}
		}
		printf("\033[0m");
	}

	else if(strcmp(variable,"ls -a")==0)
	{
		struct dirent **files;
		char pathName[100];
		int count,i;

		getcwd(pathName,sizeof(pathName));
		count=scandir(pathName, &files,NULL,alphasort);

		printf("\033[0;33m");
		for(i=0;i<count;i++)
		{	
			char str[100];
			strcpy(str,files[i]->d_name);
			if(strcmp(str,".")!=0 && strcmp(str,"..")!=0)
			{
				printf("%s ",files[i]->d_name);
			}
		}
		printf("\033[0m");
		printf("\n");	
	}

	else if(strcmp(variable,"ls")==0)
	{
		struct dirent **files;
		char pathName[100];
		int count,i;

		getcwd(pathName,sizeof(pathName));
		count=scandir(pathName, &files,NULL,alphasort);

		printf("\033[0;33m");
		for(i=0;i<count;i++)
		{	
			char str[100];
			strcpy(str,files[i]->d_name);
			if(strcmp(str,".")!=0 && strcmp(str,"..")!=0 && files[i]->d_name[0]!='.')
			{
				printf("%s ",files[i]->d_name);
			}
		}
		printf("\033[0m");
		printf("\n");	
	}

	else
	{
		printf("\033[1;31m");
		printf("Wrong Input\n");
		printf("\033[0m");
	}
	return 0;
}