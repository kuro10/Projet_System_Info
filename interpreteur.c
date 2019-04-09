#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "interpreteur.h"

ligneinter tab_inter[1000];
int md[1024];
int ip;
int rg[16];
int ligne = 0;

void ajout_ligne_inter(char * operation, char * p1, char * p2){
	strcpy(tab_inter[ligne].op , operation);
	strcpy(tab_inter[ligne].p1 , p1);
	strcpy(tab_inter[ligne].p2 , p2);
	ligne+=1;
}

void changejumpline(int linenum, char* value){
	strcpy(tab_inter[linenum].p1 , value);
}

void affiche_line(ligneinter l){
	printf ("op: %s, p1: %s, p2: %s\n",l.op, l.p1, l.p2 ); 
}


void affiche_inter(){	
	int i;
	for(i=0;i<ligne;i++){
		printf("line %d  ",i);
		affiche_line(tab_inter[i]);					
   	}
}


int getligne(){
	return ligne;
}

ligneinter getligne(int i){
	return tab_inter[i];
}

void lire(){  
    FILE *f;
	f = fopen("assembleur.txt","r");
	char * line=NULL;
	size_t len=0;
	ssize_t read;

	if(f==NULL){
		printf("fail to open the assembleur\n");
		exit(1);
	}
	while((read=getline(&line,&len,f))!=-1){
		char * token = strtok(line," ");
		char * tokenarray[4];
		int i=0;
   		while(token){
			tokenarray[i]=token;
			i++;
			token = strtok(NULL, " ");
		}
		ajout_ligne_inter(tokenarray[0],tokenarray[1],tokenarray[2]);
	}

	fclose(f);
	if(line){
		free(line);
	}
}

void interpreter () {
	int i=0;	
	lire ();
	while(i<ligne){
		char * op= tab_inter[i].op;
		char * p1= tab_inter[i].p1;
		char * p2= tab_inter[i].p2;

		int j =-1;
		if(strcmp("AFC",op)==0){
			j=0;
		}else if(strcmp("Store",op)==0){
			j=1;
		}

		switch (j) {
    		case 0: 
				rg[0]= atoi(p2);
				break;
			case 1: 
				md[atoi(p1)]=rg[0];
				break;
			default: 
				break;
		}
		i++;
	}
}


char * inttochare(int o){
	char *p, text[10];

	sprintf(text,"%d",o);
	p = text;
	return p;
}


void afficherm() {}

