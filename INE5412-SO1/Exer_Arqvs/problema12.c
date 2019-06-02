#include <stdio.h>
#include <string.h>

typedef struct {
	int a;
	int b;
} meus_numeros;

int main(int argc, char **argv) {
	FILE *f;
	FILE *new;
	if ( (f = fopen("inteiros.bin", "rb")) == NULL ) {
		printf("Erro ao abrir arquivo \n");
		return 1;
	}
	if ( (new = fopen("inteiros-texto.txt", "w")) == NULL ) {
		printf("Erro ao abrir arquivo \n");
		return 1;
	}
	meus_numeros numeros;
	int i = 0;
	while (fread(&numeros, sizeof(meus_numeros),1, f) == 1) {
		char s[50];
		sprintf(s, "Item %d: A=%d B=%d\n", i, numeros.a, numeros.b);
		fwrite(&s, sizeof(s), 1, new);
		i += 1;
	}

	fclose(f);
	fclose(new);
	return 0;
}
