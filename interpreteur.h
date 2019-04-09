typedef struct ligneinter{
	char op[10];
	char p1[5];
	char p2[5];
} ligneinter;

void ajout_ligne_inter(char * operation, char * p1, char * p2);

void affiche_inter();

int getligne();

ligneinter getligne(int indice);

void changejumpline(int linenum, char* value);
