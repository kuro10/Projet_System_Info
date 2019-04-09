
%{
#include <stdio.h>
#include "TdS.h"	
int yylex();
void yyerror(char * );
char * type; 
%}

%union{
	int nb;
	char * str;
}

%token <nb> tNB
%token <str> tTEXT
%token tPO tPF tAO tAF tV tPV tINT tCONST tMAIN tERROR tWHILE tEQU tSUP tINF tSOE tIOE tRET

%start Input

%right tAFFECT
%left tPLUS tMOINS
%left tETOILE tSLASH
%left tIF tELSE



%%
Input 	: 	BlocFcts BlocMain {printf("message Fct+Main \n");}
		| 	BlocMain {printf("message Main \n");}
		| 	BlocFcts {printf("message Fcts \n");}
		;

Body	:	Content Body 
		|
		;

Content :	Declaration tPV 
		|	Expr tPV
		|	BlocIf
		|	BlocWhile
		|	AppelFunction tPV
		;

/* Main Bloc*/

BlocMain: 	tINT tMAIN tPO Parameters tPF AO Body Return AF
AO		:	tAO { incr_profondeur(); }
AF		:	tAF { decr_profondeur(); }
Args 	: 	Arg tV Args | Arg 
Arg 	: 	Type tTEXT | Type Pointeur ;


/* Declarations des fcts*/
BlocFcts: 	BlocFct | BlocFcts BlocFct  ;

BlocFct	:	Type Name tPO Parameters tPF AO Body Return AF;

Return 	: 	tRET Expr tPV |
		;

/*Expression arithmetique*/
Expr 	:	Expr tAFFECT Expr 	
		|	Expr tPLUS Expr 
		|	Expr tMOINS Expr
		|	Expr tETOILE Expr
		|	Expr tSLASH Expr
		|	tPO Expr tPF
		| 	tTEXT
		| 	tNB 
		;

/*Expression conditionnelle*/

	/* IF THEN ELSE */
BlocIf	:	tIF tPO Cond tPF AO Body AF tELSE AO Body AF	
		|	tIF tPO Cond tPF AO Body AF 
		;

	/* WHILE */
BlocWhile 	: 	tWHILE tPO Cond tPF AO Body AF;

	/* Condition */
Cond	: 	Expr tEQU Expr 
		|	Expr tSUP Expr
		|	Expr tINF Expr
		|	Expr tSOE Expr
		|	Expr tIOE Expr
		|	Expr 	
		|
		;

/*Declaration*/

Declaration : Type Names 
	 		| Type Name tAFFECT AppelFunction 
	 		| Type Name tAFFECT Expr 					
			;

Type 	: 	tINT { type = "int"; } ;
Names 	: 	Name | Name tV Names ;
Name 	: 	tTEXT  { push(type, $1); } 	
			;
/*Appel des Fcts*/
AppelFunction: 	F_Name tPO Parameters tPF
F_Name  :   tTEXT	 
Parameters:	F_Args | Args |  
F_Args 	: 	F_Arg tV F_Args | F_Arg
F_Arg 	: 	tNB | tTEXT;


/*Pointeur*/
Pointeur: 	Etoiles tTEXT;
Etoiles : 	tETOILE | tETOILE Etoiles;



%% 
void yyerror(char *s)
{
	fprintf(stderr, "%s\n", s);
}

int main(){
	yyparse();
	// prend tableau -> file
}

