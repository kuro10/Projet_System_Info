
/*Structure*/

typedef struct{
	char type[5];	//type de var
	char nom[10];	//nom de var
	int profondeur; //portée
	int adr; 		//adresse 
} Type_symbole;

/*struct{
	Type_symbole TdS[100];
	int base = 0;
	int sommet = 0;
} Type_tab;*/


/*Interface*/

/*void entree_fonction(void);
void sortie_fonction(void);
int ajoute_symbole(char *nom, int profondeur, int adr);
int recherche_executable(char *nom);
int recherche_declarative(char *nom);
void affiche_table(void);*/
void incr_profondeur(void);
void decr_profondeur(void);
void push(char * type, char * nom);
void afficher_table(void);
void ecrire(char * contenu);
//Type_symbole get(char * nom);
