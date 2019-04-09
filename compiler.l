
%{
#include "y.tab.h"
#include "TdS.h"
%}
NB [0-9]+


%%
"if"					{return tIF;}
"else"					{return tELSE;}
"while"					{return tWHILE;}
"return"				{return tRET;}

"==" 					{return tEQU;}
">=" 					{return tSOE;}
"<=" 					{return tIOE;}

">" 					{return tSUP;}
"<" 					{return tINF;}

"=" 					{return tAFFECT;}
"+" 					{return tPLUS;}
"-" 					{return tMOINS;}
"*" 					{return tETOILE;}
"/" 					{return tSLASH;}
"(" 					{return tPO;}
")" 					{return tPF;}
"{" 					{return tAO;}
"}" 					{return tAF;}
"," 					{return tV;}
";" 					{return tPV;}
"int" 					{return tINT;}
"const" 				{return tCONST;}
"main" 					{return tMAIN;}
[ \t\n] 				{}

{NB} 					{
							yylval.nb=atoi(yytext);						
							return tNB;
						}

[a-zA-Z][a-zA-Z0-9_]* 	{
							yylval.str=strdup(yytext);						
							return tTEXT;
						}

. 						{return tERROR;}


