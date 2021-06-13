#include<stdio.h>
#include<string.h>
#include<unistd.h>
int main(int argc,char *argv[])
{
	char variable[strlen(argv[1])];
	strcpy(variable,argv[1]);

	char *str;
	str=strtok(variable," ");
	str=strtok(NULL," ");

	if(str==NULL)
	{
		while(1)
		{
			char st[1000];
			scanf("%[^\n]%*c",st);
			printf("%s\n",st);
		}
	}
	else if(strcmp(str,"-n")!=0 && strcmp(str,"-E")!=0)
	{
		if(chdir(str)!=0)
		{
			FILE *fptr=fopen(str,"r");
			if(fptr==NULL)
			{
				printf("Unable to open the file\n");
			}

			else
			{
				char ch=fgetc(fptr);
				while(ch!=EOF)
				{
					printf("%c",ch);
					ch=fgetc(fptr);
				}
				printf("\n");
				fclose(fptr);
			}
		}

		else
		{
			printf("cat: %s: Is a directory\n",str);
		}
	}

	else if(strcmp(str,"-n")==0)
	{
		str=strtok(NULL,"\n");
		FILE *fptr=fopen(str,"r");
		if(fptr==NULL)
		{
			printf("Unable to open the file\n");
		}

		else
		{
			char ch=fgetc(fptr);
			int t=1;
			printf("%d\t",t);
			int q=-1;
			while(ch!=EOF)
			{
				printf("%c",ch);

				if(ch=='\n')
				{
					t=t+1;
					q=0;
				}
				ch=fgetc(fptr);
				if(ch!=EOF && q==0)
				{
					q=-1;
					printf("%d\t",t);
				}

			}
			printf("\n");
			fclose(fptr);
		}
	}

	else if(strcmp(str,"-E")==0)
	{
		str=strtok(NULL,"\n");
		FILE *fptr=fopen(str,"r");
		if(fptr==NULL)
		{
			printf("Unable to open the file\n");
		}

		else
		{
			char ch=fgetc(fptr);
			while(ch!=EOF)
			{
				printf("%c",ch);

				ch=fgetc(fptr);
				if(ch!=EOF && ch=='\n')
				{
					printf("$");
				}

			}
			printf("\n");
			fclose(fptr);
		}
	}

	else
	{
		printf("\033[1;31m");
		printf("Wrong Input\n");
		printf("\033[0m");
	}
	return 0;
}