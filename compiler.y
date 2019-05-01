
%{
#include <stdio.h>
#include <string.h>
#include "TdS.h"	
#include "interpreteur.h"	
int yylex();
void yyerror(char * );
char * type;
char * var_name;
int tmp = 0;
int used = 0; 
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
			{ 
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  interpreter();
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  interpreter();
			  
			  ajout_ligneinter("ADD", used-1, used-1, used);
			  used--;
			  
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  push(type, name);
			  ajout_ligneinter("STORE", get_adr(name), used, -1); 
			  interpreter();
			}
		|	Expr tMOINS Expr
			{ 
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  interpreter();
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  interpreter();
			  
			  ajout_ligneinter("SUB", used-1, used-1, used);
			  used--;
			  
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  push(type, name);
			  ajout_ligneinter("STORE", get_adr(name), used, -1); 
			  interpreter();
			}
		|	Expr tETOILE Expr
			{ 
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  interpreter();
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  interpreter();
			  
			  ajout_ligneinter("MUL", used-1, used-1, used);
			  used--;
			  
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  push(type, name);
			  ajout_ligneinter("STORE", get_adr(name), used, -1); 
			  interpreter();
			}
		|	Expr tSLASH Expr
			{ 
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  interpreter();
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  interpreter();
			  
			  ajout_ligneinter("DIV", used-1, used-1, used);
			  used--;
			  
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  push(type, name);
			  ajout_ligneinter("STORE", get_adr(name), used, -1); 
			  interpreter();
			}
		|	tPO Expr tPF
		| 	tTEXT
		| 	tNB 				
			{ 
			  printf("tmp = %d\n", tmp);
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;

			  push(type, name);
			  ajout_ligneinter("AFC", used, $1, -1);
			  ajout_ligneinter("STORE", get_adr(name), used, -1);
			  interpreter();
			}
		|	AppelFunction 
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
	 		| Type Name tAFFECT Expr 				
				{
				  pop();
				  push(type, var_name);
				}	
			;

Type 	: 	tINT { type = "int"; } ;
Names 	: 	Name | Name tV Names ;
Name 	: 	tTEXT  { var_name = $1; } 	
			;
/*Appel des Fcts*/
AppelFunction: 	F_Name tPO Parameters tPF;
F_Name  :   tTEXT	 ;
Parameters:	F_Args | Args |  ;
F_Args 	: 	F_Arg tV F_Args | F_Arg;
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

