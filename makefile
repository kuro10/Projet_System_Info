compiler: y.tab.c lex.yy.c TdS.c interpreteur.c
	gcc -o compiler y.tab.c lex.yy.c TdS.c interpreteur.c -ly -ll

y.tab.c: compiler.y
	yacc -d -v compiler.y

lex.yy.c: compiler.l
	flex compiler.l

test: compiler
	./compiler < test3

clean:
	rm lex.yy.c y.tab.c y.tab.h
