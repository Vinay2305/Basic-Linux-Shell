#include<stdio.h>
#include<string.h>
#include<sys/stat.h>
#include<unistd.h>

int main(int argc,char *argv[])
{
	char variable[strlen(argv[1])];
	strcpy(variable,argv[1]);

	char *str;
	str=strtok(variable," ");
	str=strtok(NULL," ");

	if(strcmp(str,"-v")!=0 && strcmp(str,"-p")!=0)
	{
		while(str!=NULL)
		{
			if(mkdir(str,0777)==0)
				;

			else
				printf("mkdir: cannot create directory '%s'\n",str);

			str=strtok(NULL," ");
		}
	}

	else if(strcmp(str,"-v")==0)
	{
		str=strtok(NULL," ");
		while(str!=NULL)
		{
			if(mkdir(str,0777)==0)
				printf("mkdir: created directory '%s'\n",str);

			else
				printf("mkdir: cannot create directory '%s'\n",str);

			str=strtok(NULL," ");
		}	
	}

	else if(strcmp(str,"-p")==0)
	{
		str=strtok(NULL," ");
		char temp[strlen(str)];
		strcpy(temp,str);

		char *point;
		point=strtok(temp,"/");
		
		if(strcmp(point,str)==0)
		{

		}

		else
		{
			int counter=0;
			while(point!=NULL)
			{
				if(mkdir(point,0777)==0)
					printf("mkdir: created directory '%s'\n",point);

				else
					printf("mkdir: cannot create directory '%s'\n",point);

				chdir(point);
				counter=counter+1;
				point=strtok(NULL,"/");
			}
			while(counter>0)
			{
				chdir("..");
				counter=counter-1;
			}
		}
	}
	return 0;
}