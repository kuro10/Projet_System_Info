#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "interpreteur.h"

ligneinter tab_inter[1000];
int memoire[1024];
int ip;
int registre[16];
int ligne = 0;

void ajout_ligneinter (char * op, int rA, int rB, int rC) {
	strcpy(tab_inter[ligne].op , operation);
	tab_inter[ligne].rA = rA;
	tab_inter[ligne].rB = rB;
	tab_inter[ligne].rC = rC;	
	ligne++;
}

void afficher_ligne(ligneinter l) {
	printf("Operateur : %s | Registre 1 : %s | Registre 2 : %s | Registre 3 : %s\n", l.op, l.rA, l.rB, l.rC);
}

void afficher_tabinter(void) {
	for (int i = 0; i < ligne; i++) {
		afficher_ligne(tab_inter[i]);
	}
	printf("\n");
}

void interpreter () {
	int i=0;	
	lire ();
	while(i<ligne){
		char * op;
		strcpy(op, tab_inter[i].op);
		int rA = tab_inter[i].rA;
		int rB = tab_inter[i].rB;
		int rC = tab_inter[i].rC;

		if (strcmp(op, "ADD")) {
			registre[rC] = registre[rA] + registre[rB];
		} else if (strcmp(op, "SUB")) {
			registre[rC] = registre[rA] - registre[rB];
		} else if (strcmp(op, "MUL")) {
			registre[rC] = registre[rA] * registre[rB];
		} else if (strcmp(op, "DIV")) {
			registre[rC] = registre[rA] / registre[rB];
		} else if (strcmp(op, "LOAD")) {
			registre[rC] = registre[rA] + registre[rB];
		} else if (strcmp(op, "STORE")) {
			registre[rC] = registre[rA] + registre[rB];
		} else if (strcmp(op, "AFC")) {
			registre[rC] = registre[rA] + registre[rB];
		} else if
		i++;
	}
}
