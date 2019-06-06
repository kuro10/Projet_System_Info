#ifndef INTERPRETEUR_H
#define INTERPRETEUR_H

typedef struct ligneinter{
	char op[10];
	int rA;
	int rB;
	int rC;
} ligneinter;

void ajout_ligneinter (char * op, int rA, int rB, int rC);
void afficher_tabinter();
void interpreter();
void update_rA(int index, int new_rA);
int from_registre(int r);
int current_exc();
int current_index();

#endif

