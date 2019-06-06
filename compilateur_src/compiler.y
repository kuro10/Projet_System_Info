
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
int flag_if;
int flag_while1;
int flag_while2 = 0; 
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
		{
			interpreter();
		}
AO		:	tAO 
		{ 
			incr_profondeur();
		}
AF		:	tAF 
		{ 
			decr_profondeur();
		}
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
			  pop();
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  
			  ajout_ligneinter("ADD", used-1, used-1, used);
			  used--;
			  
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  push(type, name);
			  ajout_ligneinter("STORE", get_adr(name), used, -1);
			}
		|	Expr tMOINS Expr
			{ 
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  
			  ajout_ligneinter("SUB", used-1, used-1, used);
			  used--;
			  
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  push(type, name);
			  ajout_ligneinter("STORE", get_adr(name), used, -1); 
			}
		|	Expr tETOILE Expr
			{ 
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  
			  ajout_ligneinter("MUL", used-1, used-1, used);
			  used--;
			  
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  push(type, name);
			  ajout_ligneinter("STORE", get_adr(name), used, -1); 
			}
		|	Expr tSLASH Expr
			{ 
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  
			  ajout_ligneinter("DIV", used-1, used-1, used);
			  used--;
			  
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  push(type, name);
			  ajout_ligneinter("STORE", get_adr(name), used, -1); 
			}
		|	tPO Expr tPF
		| 	tTEXT
			{ 
			  printf("tmp = %d\n", tmp);
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  
			  push("int", name);
			  ajout_ligneinter("LOAD", used, get_adr($1), -1);
			  ajout_ligneinter("STORE", get_adr(name), used, -1);
			}		
		| 	tNB 				
			{ 
			  printf("tmp = %d\n", tmp);
			  char name[4] = "tmp";
			  char tmp_num[5];
			  snprintf(tmp_num, 5, "%d", tmp);
			  strcat(name, tmp_num);
			  tmp++;
			  
			  push("int", name);
			  ajout_ligneinter("AFC", used, $1, -1);
			  ajout_ligneinter("STORE", get_adr(name), used, -1);
			}
		|	AppelFunction 
		;

/*Expression conditionnelle*/

	/* IF THEN ELSE */
BlocIf	:	tIF tPO Cond tPF action_if AO Body AF ELSE AO Body AF	
		|	tIF tPO Cond tPF action_if AO Body AF 
		{
				update_rA(flag_if, current_index());
		}
		;
ELSE	: tELSE 
		{
				update_rA(flag_if, current_index());
		}
		;
action_if	:	
		{
				ajout_ligneinter("AFC", 1, from_registre(10), -1);
				ajout_ligneinter("JMPC", -1, 1, -1);
				flag_if = current_index() - 1;
		}
		;
		
	/* WHILE */
BlocWhile 	: 	tWHILE tPO Cond tPF action_while AO Body AF
		{
				update_rA(flag_while2, current_index());
				interpreter();
		}
		;

action_while : 
		{
				ajout_ligneinter("AFC", 11, from_registre(10), -1);
				ajout_ligneinter("AFC", 12, 1-from_registre(10), -1);
				ajout_ligneinter("JMPC", -1, 11, -1);
				ajout_ligneinter("JMPC", flag_while1, 12, -1);
			    printf("2nd : it contains : %d\n", from_registre(10));
				flag_while2 = current_index() - 2;
				printf("3rd : flag_while2 contains : %d\n", flag_while2);
		}
		;				

	/* Condition */
Cond	: 	Expr tEQU Expr 
		{
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  
			  ajout_ligneinter("EQU", 10, used-1, used);
			  used--;
			  interpreter();
			  flag_while1 = current_index() - 3;
			  
		}
		|	Expr tSUP Expr
		{
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  
			  ajout_ligneinter("SUP", 10, used-1, used);
			  used--;
			  printf("1st : it contains : %d\n", from_registre(used-1));
			  interpreter();
			  flag_while1 = current_index() - 3;
		}
		|	Expr tINF Expr
		{
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  
			  ajout_ligneinter("INF", 10, used-1, used);
			  used--;
			  interpreter();
			  flag_while1 = current_index() - 3;
		}
		|	Expr tSOE Expr
		{
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  
			  ajout_ligneinter("SUPE", 10, used-1, used);
			  used--;
			  interpreter();
			  flag_while1 = current_index() - 3;
		}
		|	Expr tIOE Expr
		{
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  used++;
			  printf("tmp = %d\n", tmp);
			  tmp--;
			
			  ajout_ligneinter("LOAD", used, get_lastline_adr(), -1);
			  pop();
			  printf("tmp = %d\n", tmp);
			  tmp--;
			  
			  ajout_ligneinter("INFE", 10, used-1, used);
			  used--;
			  interpreter();
			  flag_while1 = current_index() - 3;
		}
		|	tNB	
		{
			  ajout_ligneinter("AFC", 10, $1, -1);
			  interpreter();
		}
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

