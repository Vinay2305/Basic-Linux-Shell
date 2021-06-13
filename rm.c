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

	if(strcmp(str,"-i")==0)
	{
		str=strtok(NULL," ");
		while(str!=NULL)
		{
			if(chdir(str)!=0)
			{
				printf("rm: remove regular file '%s'?",str);
				char ch;
				scanf("%c",&ch);
				if(ch=='y'||ch=='Y')
				{
					if(remove(str)==0)
						;
					else
						printf("rm: cannot remove '%s'\n",str);
				}
			}

			else
				printf("rm: cannot remove '%s'\n",str);
			str=strtok(NULL," ");
		}
	}

	else if(strcmp(str,"-d")==0)
	{
		str=strtok(NULL," ");
		while(str!=NULL)
		{
			if(remove(str)==0)
				;
			else
				printf("rm: cannot remove '%s'\n",str);

			str=strtok(NULL," ");
		}
	}

	else
	{
		if(chdir(str)!=0)
		{
			if(remove(str)==0)
				;
			else
				printf("rm: cannot remove '%s'\n",str);
		}
		else
			printf("rm: cannot remove '%s'\n",str);
	}
}