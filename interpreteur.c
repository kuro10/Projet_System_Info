#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "interpreteur.h"

ligneinter tab_inter[1000];
int memoire[1024];
int ip;
int registre[16];
int ligne_i= 0;
int exc = 0;

void ajout_ligneinter (char * op, int rA, int rB, int rC) {
	strcpy(tab_inter[ligne_i].op , op);
	tab_inter[ligne_i].rA = rA;
	tab_inter[ligne_i].rB = rB;
	tab_inter[ligne_i].rC = rC;	
	ligne_i++;
	afficher_tabinter();
}

void afficher_ligne(ligneinter l) {
	printf("Operateur : %s | Registre 1 : %d | Registre 2 : %d | Registre 3 : %d\n", l.op, l.rA, l.rB, l.rC);
}

void afficher_tabinter() {
	for (int i = exc; i < ligne_i; i++) {
		afficher_ligne(tab_inter[i]);
	}
	printf("\n");
}

void interpreter() {
	while(exc < ligne_i){
		char op[5];
		strcpy(op, tab_inter[exc].op);
		int rA = tab_inter[exc].rA;
		int rB = tab_inter[exc].rB;
		int rC = tab_inter[exc].rC;
		if (!strcmp(op, "ADD")) {
			registre[rA] = registre[rB] + registre[rC];
			printf("Somme de r%d et r%d est %d\n", rB, rC, registre[rA]);
		} else if (!strcmp(op, "SUB")) {
			registre[rA] = registre[rB] - registre[rC];
		} else if (!strcmp(op, "MUL")) {
			registre[rA] = registre[rB] * registre[rC];
		} else if (!strcmp(op, "DIV")) {
			registre[rA] = registre[rB] / registre[rC];
		} else if (!strcmp(op, "AFC")) {
			registre[rA] = rB;
			printf("r%d est affecte' a` %d\n", rA, rB);
		} else if (!strcmp(op, "STORE")) {
			memoire[rA] = registre[rB];
			printf("r%d contient maintenant %d dans l'adresse @%d\n", rB, memoire[rA], rA);
		} else if (!strcmp(op, "LOAD")) {
			registre[rA] = memoire[rB];
			printf("r%d est charge' de %d depuis l'adresse @%d\n", rA, memoire[rB], rB);
		}
		exc++;
	}
}

/*int main() {
	printf("%d\n", exc);
	ajout_ligneinter("AFC", 1, 5, -1);
	afficher_tabinter();
	ajout_ligneinter("AFC", 2, 10, -1);
	ajout_ligneinter("ADD", 0, 1, 2);
	interpreter();
	printf("%d\n", exc);
	printf("%d\n", registre[0]);
}*/

