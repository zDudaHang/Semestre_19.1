#include <stdio.h>
#include <string.h>

typedef struct {
	int a;
	int b;
} meus_numeros;

int main(int argc, char **argv) {
	FILE *f;
	if ( (f = fopen("inteiros.bin", "r")) == NULL ) {
		printf("Erro ao abrir arquivo \n");
		return 1;
	}
	meus_numeros numeros;
	int i = 0;
	while (fread(&numeros, sizeof(meus_numeros),1, f) == 1) {
		printf("Item %d: A=%d B=%d\n", i, numeros.a, numeros.b);
		i += 1;
	}

	fclose(f);
	return 0;
}