/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tNB = 258,
    tTEXT = 259,
    tPO = 260,
    tPF = 261,
    tAO = 262,
    tAF = 263,
    tV = 264,
    tPV = 265,
    tINT = 266,
    tCONST = 267,
    tMAIN = 268,
    tERROR = 269,
    tWHILE = 270,
    tEQU = 271,
    tSUP = 272,
    tINF = 273,
    tSOE = 274,
    tIOE = 275,
    tRET = 276,
    tAFFECT = 277,
    tPLUS = 278,
    tMOINS = 279,
    tETOILE = 280,
    tSLASH = 281,
    tIF = 282,
    tELSE = 283
  };
#endif
/* Tokens.  */
#define tNB 258
#define tTEXT 259
#define tPO 260
#define tPF 261
#define tAO 262
#define tAF 263
#define tV 264
#define tPV 265
#define tINT 266
#define tCONST 267
#define tMAIN 268
#define tERROR 269
#define tWHILE 270
#define tEQU 271
#define tSUP 272
#define tINF 273
#define tSOE 274
#define tIOE 275
#define tRET 276
#define tAFFECT 277
#define tPLUS 278
#define tMOINS 279
#define tETOILE 280
#define tSLASH 281
#define tIF 282
#define tELSE 283

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 14 "compiler.y" /* yacc.c:1909  */

	int nb;
	char * str;

#line 115 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
