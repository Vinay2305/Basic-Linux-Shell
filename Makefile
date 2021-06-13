all:
	gcc ls.c -o ls
	gcc -E ls.c>ls.i
	gcc -S ls.c>ls.s
	gcc cat.c -o cat
	gcc -E cat.c>cat.i
	gcc -S cat.c>cat.s
	gcc date.c -o date
	gcc -E date.c>date.i
	gcc -S date.c>date.s
	gcc rm.c -o rm
	gcc -E rm.c>rm.i
	gcc -S rm.c>rm.s
	gcc mkdir.c -o mkdir
	gcc -E mkdir.c>mkdir.i
	gcc -S mkdir.c>mkdir.s
	gcc terminal.c -o terminal
	gcc -E terminal.c>terminal.i
	gcc -S terminal.c>terminal.s
	./terminal
	

