# Basic-Linux-Shell
I have created a basic Linux Shell which provides a command line interface to the user. The program uses standard C libraries including Linux system calls such as fork(), exec(), etc. Internal commands are those which are interpreted by the shell program itself, without requiring a different program. External commands are on the other hand which are not directly handled by the shell program but by an external program.
Examples of internal commands implemented in this shell are 'cd', 'pwd', 'exit', 'echo' & 'history'. These commands would be handled by the shell directly.
Examples of external commands implemented in this shell are 'ls', 'cat', 'date', 'rm' & 'mkdir'. For these external commands, there's a different program written to handle these commands. Therefore, to handle these commands the shell would typically create a new process, using the fork() system call and within each process I use the exec() family system call to run the individual program.

I have included all the intermediate files from the compilation to execution for each program.
Run this command in the directory of the makefile to run the linux terminal :
```
make
```
