#include <stdio.h>
#include <string.h>
#include "TdS.h"

Type_symbole tab_sym[100];
int current_max = 0;
int ligne = 0;
int adr = 0;
int profondeur = 0;
int tab_memo[100];

int check_exist(char * nom) {
	int i = 0;
	int found = 0;
	while (i < ligne && found == 0) {
		if (strcmp(tab_sym[i].nom,nom) == 0 && tab_sym[i].profondeur == profondeur) {
			found = 1;
		}
		i++;
	}
	return found;
}

void incr_profondeur() {
	tab_memo[profondeur] = ligne;
	profondeur++;
}

void decr_profondeur() {
	ligne = tab_memo[profondeur-1];
	profondeur--;
}

void push(char * type, char * nom) {
	if (check_exist(nom) == 0) {
		if (ligne == current_max) {
			strcpy(tab_sym[ligne].type, type);
			strcpy(tab_sym[ligne].nom, nom);
			tab_sym[ligne].profondeur = profondeur;
			tab_sym[ligne].adr = adr;
			adr = adr + 4;
			ligne++;
			current_max++;
		}
		else {
			strcpy(tab_sym[ligne].type, type);
			strcpy(tab_sym[ligne].nom, nom);
			tab_sym[ligne].profondeur = profondeur;
			ligne++;
		}
	}
	afficher_table();
}

void afficher_sym(Type_symbole s) {
	printf("Type : %s | Nom: %s | Profondeur : %d | Adr : %d\n", s.type, s.nom, s.profondeur, s.adr);
}

void afficher_table(void) {
	for (int i = 0; i < current_max; i++) {
		afficher_sym(tab_sym[i]);
	}
	printf("\n");
}

/*int main() {
	push("Hieu", 20, 626);

	afficher_table();
}*/
