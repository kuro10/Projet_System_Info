compiler: y.tab.c lex.yy.c TdS.c
	gcc -o compiler y.tab.c lex.yy.c TdS.c -ly -ll

y.tab.c: compiler.y
	yacc -d compiler.y

lex.yy.c: compiler.l
	flex compiler.l

test: compiler
	./compiler < test2

clean:
	rm lex.yy.c y.tab.c y.tab.h
