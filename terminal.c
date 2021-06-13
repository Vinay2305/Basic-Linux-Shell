#include<stdio.h>
#include<unistd.h>
#include<string.h>
#include<sys/dir.h>
#include<sys/types.h>
#include<sys/param.h>
#include<time.h>
#include<sys/stat.h>
#include<sys/wait.h>
#include<stdlib.h>

void displayMenu()
{
	printf("\033[H\033[J");
	printf("Welcome to my own shell");
	printf("\n\n\n");
	printf("You can use any of the following commands :\n");
	printf("\nInternal Commands: cd , echo , history , pwd , exit");
	printf("\n \nExternal Commands: ls , cat , date , rm , mkdir");
	printf("\n \n");
	sleep(1);
}

void printCurrentDirectory(char string[])
{
	char variable[strlen(string)];
	strcpy(variable,string);

	char *str;
	str=strtok(variable," ");
	str=strtok(NULL,"\n");

	if(str==NULL || strcmp(str,"-L")==0)
	{
		char dir[2048];
		getcwd(dir,sizeof(dir));
		printf("%s",dir);
	}

	else if(strcmp(str,"-P")==0)
	{
		char *dir;
		dir=getenv("PWD");
		printf("%s",dir);
	}

	else
	{
		printf("\033[1;31m");
		printf("Wrong Input");
		printf("\033[0m");
	}
}

void moveToParent(char string[])
{
	if(strcmp(string,"cd ..")==0)
		chdir("..");

	else if(strcmp(string,"cd")==0)
	{
		char dir[2048];
		getcwd(dir,sizeof(dir));
		while(strcmp(dir,"/home/vinay9821")!=0)
		{
			chdir("..");
			getcwd(dir,sizeof(dir));
		}
	}
	else
	{
		char *str;
		str=strtok(string," ");
		str=strtok(NULL," ");

		if(chdir(str)==0)
			;
		else
			printf("bash: cd: %s: No such file or directory\n",str);
	}
}

void ef(char string[])
{
	char variable[strlen(string)];
	strcpy(variable,string);

	char *str;
	str=strtok(variable," ");
	str=strtok(NULL," ");

	if(str==NULL)
	{
		printf("\n");
	}

	else if(strcmp(str,"-n")!=0 && strcmp(str,"-e")!=0)
	{
		while(str!=NULL)
		{
			printf("%s",str);
			str=strtok(NULL," ");
			printf(" ");
		}
		printf("\n");
	}

	else if(strcmp(str,"-n")==0)
	{
		str=strtok(NULL,"\n");
		if(str==NULL)
		{
			printf("\n");
		}
		else
			printf("%s",str);
	}

	else if(strcmp(str,"-e")==0)
	{
		str=strtok(NULL," ");
		while(str!=NULL)
		{
			char a1[]={'\'','\\','\\','\'','\0'};
			char a2[]={'\'','\\','a','\'','\0'};
			char a3[]={'\'','\\','b','\'','\0'};
			char a4[]={'\'','\\','e','\'','\0'};
			char a5[]={'\'','\\','f','\'','\0'};
			char a6[]={'\'','\\','n','\'','\0'};
			char a7[]={'\'','\\','r','\'','\0'};
			char a8[]={'\'','\\','t','\'','\0'};
			char a9[]={'\'','\\','v','\'','\0'};

			if(strcmp(str,a1)==0)
			{
				char st='\\';
				printf("%c ",st);
			}

			else if(strcmp(str,a2)==0)
			{
				char st='\a';
				printf("%c ",st);
			}
			else if(strcmp(str,a3)==0)
			{
				char st='\b';
				printf("%c ",st);
			}
			else if(strcmp(str,a4)==0)
			{
				char st='\e';
				printf("%c ",st);
			}
			else if(strcmp(str,a5)==0)
			{
				char st='\f';
				printf("%c ",st);
			}
			else if(strcmp(str,a6)==0)
			{
				char st='\n';
				printf("%c ",st);
			}
			else if(strcmp(str,a7)==0)
			{
				char st='\r';
				printf("%c ",st);
			}
			else if(strcmp(str,a8)==0)
			{
				char st='\t';
				printf("%c ",st);
			}
			else if(strcmp(str,a9)==0)
			{
				char st='\v';
				printf("%c ",st);
			}

			else
			{
				if(str==NULL)
				{
					printf("\n");
				}
				else
					printf("%s ",str);
			}
			str=strtok(NULL," ");
		}
		printf("\n");
	}

	else
	{
		printf("\033[1;31m");
		printf("Wrong Input\n");
		printf("\033[0m");
	}
}

int i=0;
char hist_cmd[100][100];

void showHistory()
{
	int t=1;
	for(int k=0;k<i;k++,t++)
	{
		printf("%d  ",t);
		printf("%s\n",hist_cmd[k]);
	}
}

void storeHistory(char string[])
{
	for(int j=0;j<=strlen(string);j++)
	{
		hist_cmd[i][j]=string[j];
	}
	i++;
}

void deleteHistory()
{
	i=0;
}

void storeinFile()
{
	FILE* fptr;
	fptr=fopen("history.txt","w");

	for(int j=0;j<i;j++)
	{
		fputs(hist_cmd[j],fptr);
		fputs("\n",fptr);
	}
	fclose(fptr);

}

void exitMenu()
{
	printf("The shell is exiting in 1 second\n");
	printf("Thank you for using\n");
	sleep(1);
}

void inputValue(char string[])
{
	char tempStr[strlen(string)];
	strcpy(tempStr,string);
	char *catVar;
	catVar=strtok(tempStr," ");

	if(strcmp(catVar,"cd")==0)
		moveToParent(string);

	else if(strcmp(catVar,"echo")==0)
		ef(string);

	else if(strcmp(catVar,"history")==0)
	{
		char variable[strlen(string)];
		strcpy(variable,string);

		char *str;
		str=strtok(variable," ");
		str=strtok(NULL," ");

		if(str==NULL)
			showHistory();
		else if(strcmp(str,"-c")==0)
			deleteHistory();
		else if(strcmp(str,"-r")==0)
			storeinFile();
		else
		{
			printf("\033[1;31m");
			printf("Wrong Input\n");
			printf("\033[0m");
		}
	}

	else if(strcmp(catVar,"pwd")==0)
	{
		printf("\033[1;32m");
		printCurrentDirectory(string);
		printf("\033[0m");	//[1;32m
		printf("\n");
	}

	else if(strcmp(catVar,"exit")==0)
	{
		exitMenu();
		exit(0);
	}
	else if(strcmp(string,"clear")==0)
		printf("\033[H\033[J");

	else if(strcmp(catVar,"ls")==0)
	{
		pid_t pid;
		int i;
		pid=fork();

		if(pid==-1)
			printf("Error fork Failed");
		else if(pid>0)
		{
			wait(NULL);
		}
		else
		{
			char *args[]={"/home/vinay9821/Desktop/Assignment_1/Question_2/./ls",string,NULL}; 
			if(execvp(args[0],args)==0)
				printf("created successfully");
			exit(0);
		}
	}

	else if(strcmp(catVar,"cat")==0)
	{
		pid_t pid;
		int i;
		pid=fork();

		if(pid==-1)
			printf("Error fork Failed");
		else if(pid>0)
		{
			wait(NULL);
		}
		else
		{
			char *argv[]={"/home/vinay9821/Desktop/Assignment_1/Question_2/./cat",string,NULL}; 
			if(execvp(argv[0],argv)==0)
				printf("created successfully");
			exit(0);
		}	
	}

	else if(strcmp(catVar,"date")==0)
	{
		pid_t pid;
		int i;
		pid=fork();

		if(pid==-1)
			printf("Error fork Failed");
		else if(pid>0)
		{
			wait(NULL);
		}
		else
		{
			char *argv[]={"/home/vinay9821/Desktop/Assignment_1/Question_2/./date",string,NULL}; 
			if(execvp(argv[0],argv)==0)
				printf("created successfully");
			exit(0);
		}
	}

	else if(strcmp(catVar,"rm")==0)
	{
		pid_t pid;
		int i;
		pid=fork();

		if(pid==-1)
			printf("Error fork Failed");
		else if(pid>0)
		{
			wait(NULL);
		}
		else
		{
			char *argv[]={"/home/vinay9821/Desktop/Assignment_1/Question_2/./rm",string,NULL}; 
			if(execvp(argv[0],argv)==0)
				printf("created successfully");
			exit(0);
		}
	}

	else if(strcmp(catVar,"mkdir")==0)
	{
		pid_t pid;
		int i;
		pid=fork();

		if(pid==-1)
			printf("Error fork Failed");
		else if(pid>0)
		{
			wait(NULL);
		}
		else
		{
			char *argv[]={"/home/vinay9821/Desktop/Assignment_1/Question_2/./mkdir",string,NULL}; 
			if(execvp(argv[0],argv)==0)
				printf("created successfully");
			exit(0);
		}
	}

	else
	{
		printf("\033[1;31m");
		printf("Wrong Input\n");
		printf("\033[0m");
	}
}

int main()
{
	displayMenu();

	char input[10000];
	while(strcmp(input,"exit")!=0)
	{
		printf("\033[1;34m");
		printCurrentDirectory("pwd");
		printf("\033[0m");
		printf(">>> ");
		scanf("%[^\n]%*c", input);
		storeHistory(input);
		inputValue(input);
	}

	exitMenu();
	return 0;
}





/////////////////HERE IS THE CODE FOR THE EXTERNAL COMMANDS WHICH I HAVE USED IN OTHER FILES///////////////////////

// void ls()
// {
// 	struct dirent **files;
// 	char pathName[100];
// 	int count,i;

// 	getcwd(pathName,sizeof(pathName));
// 	count=scandir(pathName, &files,NULL,alphasort);

// 	printf("\033[0;33m");
// 	for(i=0;i<count;i++)
// 	{	
// 		char str[100];
// 		strcpy(str,files[i]->d_name);
// 		if(strcmp(str,".")!=0 && strcmp(str,"..")!=0)
// 		{
// 			printf("%s ",files[i]->d_name);
// 		}
// 	}
// 	printf("\033[0m");
// 	printf("\n");
// }

// void catCommand(char string[])
// {
// 	char variable[strlen(string)];
// 	strcpy(variable,string);

// 	char *str;
// 	str=strtok(variable," ");
// 	str=strtok(NULL,"\n");

// 	FILE *fptr=fopen(str,"r");

// 	if(fptr==NULL)
// 	{
// 		printf("Unable to open the file\n");
// 	}

// 	else
// 	{
// 		char ch=fgetc(fptr);
// 		while(ch!=EOF)
// 		{
// 			printf("%c",ch);
// 			ch=fgetc(fptr);
// 		}
// 		printf("\n");
// 		fclose(fptr);
// 	}
// }

// void currentTime()
// {
// 	time_t t;
// 	time(&t);
// 	printf("%s",ctime(&t));
// }

// void removeFile(char string[])
// {
// 	char variable[strlen(string)];
// 	strcpy(variable,string);

// 	char *str;
// 	str=strtok(variable," ");
// 	str=strtok(NULL,"\n");

// 	if(remove(str)==0)
// 		printf("Deleted Successfully\n");

// 	else
// 		printf("Failed to delete the file\n");
// }

// void makedirectory(char string[])
// {
// 	char variable[strlen(string)];
// 	strcpy(variable,string);

// 	char *str;
// 	str=strtok(variable," ");
// 	str=strtok(NULL,"\n");

// 	if(mkdir(str,0777)==0)
// 		printf("Directory created successfully\n");

// 	else
// 		printf("Directory couldnt be created\n");
// }
