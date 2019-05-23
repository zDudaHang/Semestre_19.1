#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
	int a;
	int b;
} meus_numeros;

int main(int argc, char **argv) {
	FILE *old;
	FILE *new;

	char oldName[] = "inteiros.bin";
	char newName[] = "inteirosAtualizado.bin";

	if ( (old = fopen(oldName, "rb")) == NULL ) {
		printf("Erro ao abrir arquivo \n");
		return 1;
	}
	if ( (new = fopen(newName, "ab")) == NULL ) {
		printf("Erro ao abrir arquivo \n");
		return 1;
	}

	int a, b;

	printf("Digite o primeiro valor:\n");
	scanf("%d", &a);

	printf("Digite o segundo valor:\n");
	scanf("%d", &b);

	meus_numeros procurado;
	procurado.a = a;
	procurado.b = b;
	meus_numeros numeros;

	int encontrado = 0;

	int i = 0;
	while (fread(&numeros, sizeof(meus_numeros),1, old) == 1) {
		if (procurado.a == numeros.a && procurado.b == numeros.b) {
			encontrado = 1;
			printf("Encontrado\n");
		} else {
			fwrite(&numeros, sizeof(meus_numeros), 1, new);
		}
	}

	if (!encontrado) {
		printf("Não encontrado :(\n");
	}

	fclose(old);
	fclose(new);
	remove(oldName);
	return 0;
}