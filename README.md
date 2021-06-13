# Basic-Linux-Shell
I have created a basic Linux Shell which provides a command line interface to the user. The program uses standard C libraries including Linux system calls such as fork(), exec(), etc. Internal commands are those which are interpreted by the shell program itself, without requiring a different program. External commands are on the other hand which are not directly handled by the shell program but by an external program.
Examples of internal commands implemented in this shell are 'cd', 'pwd', 'exit', 'echo' & 'history'. These commands would be handled by the shell directly.
Examples of external commands implemented in this shell are 'ls', 'cat', 'date', 'rm' & 'mkdir'. For these external commands, there's a different program written to handle these commands. Therefore, to handle these commands the shell would typically create a new process, using the fork() system call and within each process I use the exec() family system call to run the individual program.

I have included all the intermediate files from the compilation to execution for each program.
Run this command in the directory of the makefile to run the linux terminal :
```
make
```

Internal Commands

```
cd – This command is used to change the current working directory of the shell.
Optional command – cd filename -L : force symbolic links to be followed.
Optional command – cd filename -P : use the physical directory structure without following
symbolic links.

echo – The echo command is used to write arguments to the standard output. Anything which
appears after the term “echo” in the echo command is passed as standard output.
Optional command – echo -n : This command do not leave a line(\n) after printing the standard
output.
Optional command – echo -e : This command enables the interpretation of backslashes escapes.

history – This command is used to print all the inputs which have been provided by the user
(including the command itself) and keeps a track of all the inputs whether valid or invalid.
Optional command – history -c : This command is used to clear the history list by deleting all of
the entries.
Optional command – history -r : This command is used to read the history file and append the
contents to the history list.

pwd – This command is used to print the name of the current working directory.
Optional command – pwd -P : This command is used to print the physical directory , without any
symbolic links.
Optional command – pwd -L : print the value of $PWD if it names the current working directory

exit – This command is used to exit the shell.
```

External Commands
```
ls – This command is used to list information about the files (present in the current directory)
Optional command – ls -a : This command is used to print all the files present in the current
working directory including the files beginning with ‘.’ and ‘..’ characters.
Optional command – ls -1 : This command is used to print all the files line by line present in the
current working directory.

cat – This command is used to read standard input from the file and display it as standard output.
Optional command – cat -E : This command is used to display a ‘$’ character at the end of each
line.
Optional command – cat -n : This command is used to number all the output lines beginning from
1 to the last line.

date – This command is used to display the current time and date or modify the system time/date.
Optional command – date +%d : This command is used to display the day of the month(e.g., 23).
Optional command – date +%Y : This command is used to display the year of the date (e.g.,
2020).

rm – This command is used to unlink the files.
Optional command – rm -d : This command is used to remove empty directories.
Optional command – rm -i : This command is used to get a prompt before every removal of file
and asks for the permission of user. If y/Y is entered the file is removed.

mkdir – This command is used to create directories (if they do not exist).
Optional command – mkdir -v : This command prints a message for each created directory. ‘v’
stands for verbose.
Optional command – mkdir -p : This command is used to create parent directories as needed.
```
