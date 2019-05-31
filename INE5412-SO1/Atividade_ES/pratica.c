#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "pratica.h"
#include <time.h>
/*
o programa deverá solicitar que o usuário digite todos os dados do funcionário a
ser inserido (id, nome, sexo e salario). 
O programa só deverá inserir o funcionário na base de dados se o id
informado for maior do que zero e se não existir nenhum funcionário já cadastrado com o mesmo id
*/
void inserirFuncionario(FILE* arq) {
	int id;
	char nome[256];
	char sexo;
	float salario;

	printf("Digite o id:\n");

	scanf("%d%*c", &id);

	printf("Digite o nome completo:\n");

	fgets(nome, 256, stdin);

	printf("Digite o sexo (m: mulher | h: homem):\n");

	scanf("%c%*c", &sexo);

	printf("Digite o salário:\n");

	scanf("%f%*c", &salario);


	if (id <= 0) {
		printf("O id: %d não é válido.\n", id);
		exit(1);
	}

	if ( procurarFuncionario(id, arq) ) {
		exit(1);
	}

	nome[strcspn(nome, "\n")] = '\0';

	funcionario fNovo;
	fNovo.id = id;
	strcpy(fNovo.nome, nome);
	fNovo.sexo = sexo;
	fNovo.salario = salario;

	// ------------------------------- DEBUG
	mostrarFuncionario(fNovo);
	// ------------------------------- DEBUG

	int foiEscrito = fwrite(&fNovo, sizeof(funcionario), 1, arq);

	if (foiEscrito) {
		printf("Funcionário inserido com sucesso.\n");
	} else {
		printf("Não foi possível inserir o funcionário.\n");
	}

	fclose(arq);
}

/*
o usuário deverá informar o id do funcionário a ser removido. 
A remoção con-
sistirá em alterar o id do funcionário para o valor zero. 
Portanto, usuários com id=0 serão considerados como
removidos da base de dados.
*/
void removerFuncionario(FILE* arq, char* nome_arq) {
	FILE* novo;
	if ( (novo = fopen("temp.bin", "wb") ) == NULL ) {
		printf("Erro ao abrir o arquivo temporário\n");
	}

	int id = 0;

	printf("Digite o id do usuário a ser removido:\n");
	scanf("%d", &id);

	funcionario f;
	int encontrado;

	while ( fread(&f, sizeof(funcionario), 1, arq) ) {
		if (f.id == id) {
			f.id = 0;
			encontrado = 1;
			mostrarFuncionario(f);
		}
		fwrite(&f, sizeof(funcionario), 1, novo);
	}

	if(encontrado) {
		printf("O funcionário foi encontrado e removido\n");
	} else {
		printf("O funcionário não foi encontrado.\n");
	}

	fclose(novo);
	fclose(arq);
	remove("funcionarios.bin");
	rename("temp.bin", "funcionarios.bin");
}

/*
o programa deverá calcular ambas as médias e
mostrá-las na tela. O programa não poderá 
incluir os salários dos funcionários removidos do sistema.
*/

void calcularMedias(FILE* arq) {
	float somaMulheres = 0.0, somaHomens = 0.0;
	int mulheres = 0, homens = 0;

	funcionario f;
	while (fread(&f, sizeof(funcionario), 1, arq)) {
		if(f.sexo == 'm' && f.id > 0) {
			somaMulheres += f.salario;
			mulheres++;
		}

		if (f.sexo == 'h' && f.id > 0) {
			somaHomens += f.salario;
			homens++;
		}
	}
	float mediaMulheres = 0.0, mediaHomens = 0.0;
	if (mulheres > 0) {
		mediaMulheres = somaMulheres/mulheres;
	}
	if (homens > 0) {
		mediaHomens = somaHomens/homens;
	}

	printf("Resultados:\n| Quantidade de mulheres = %d\n| Soma dos salários das mulheres = %f\n| Média dos salários das mulheres = %f\n| Quantidade de homens = %d\n| Soma dos salários dos homens = %f\n| Média dos salários dos homens = %f\n", mulheres, somaMulheres, mediaMulheres, homens, somaHomens, mediaHomens);

	fclose(arq);
}

/*
o programa deverá solicitar
o nome do arquivo de texto de saída onde serão exportados os dados. 
programa não deverá exportar os funcionários removidos do sistema.
*/
void exportarDados(FILE* arq) {
	FILE* texto;
	char nome[30];
	printf("Digite um nome para o arquivo:\n");
	scanf("%s", nome);
	if ( (texto = fopen(nome, "w")) == NULL) {
		printf("Erro ao abrir o arquivo %s\n", nome);
		exit(1);
	}
	funcionario f;
	while( fread(&f, sizeof(funcionario), 1, arq) ) {
		if (f.id > 0){
			char s[350];
			// ------------------------------- DEBUG
			sprintf(s, "| Id = %d | Nome = %s | Sexo = %c | Salário = %f\n", f.id, f.nome, f.sexo, f.salario);
			// ------------------------------- DEBUG
			printf("%s", s);
			fputs(s, texto);
		}
	}

	fclose(arq);
	fclose(texto);
}

/*
o programa deverá remover fisicamente da base de dados todos os funcionários
que possuam id=0, reduzindo assim o tamanho da base de dados.
*/
void compactarDados(FILE* arq, char* nome_arq) {
	FILE* novo;

	int funcionariosRemovidos = 0;

	int funcionariosExistentes = 0;

	if ( (novo = fopen("temp.bin", "ab") ) == NULL ) {
		printf("Erro ao abrir o arquivo temporário\n");
	}

	funcionario f;

	while ( fread(&f, sizeof(funcionario), 1, arq) ) {
		// ------------------------------- DEBUG
		mostrarFuncionario(f);
		// ------------------------------- DEBUG
		if (f.id <= 0) {
			funcionariosRemovidos++;
			continue;
		}
		fwrite(&f, sizeof(funcionario), 1, novo);
		funcionariosExistentes++;
	}

	fclose(novo);
	fclose(arq);
	remove(nome_arq);
	rename("temp.bin", nome_arq);

	printf("Quantidade de usuários removidos = %d", funcionariosRemovidos);
	printf("Quantidade de usuários existentes = %d", funcionariosExistentes);
}

int main(int argc, char** argv) {
	if (argc < 3) {
		printf("Utilização correta: ./<nome_executavel> <nome_arquivo_binario> <operacao(inteiro)>\n");
		mostrarOperacoes();
		exit(1);
	}

	char* nome_arq = argv[1];

	int operacao = atoi(argv[2]);

	FILE* arq = abrirArquivo(nome_arq);

	if (arq == NULL) {
		printf("Erro ao abrir o arquivo %s\n", nome_arq);
		return 1;
	}

	switch(operacao) {
		case INSERIR:
			printf("--- INSERÇÃO DE FUNCIONÁRIO ---\n");
			inserirFuncionario(arq);
			break;

		case REMOVER:
			printf("--- REMOÇÃO DE FUNCIONÁRIO ---\n");
			removerFuncionario(arq, nome_arq);
			break;

		case MEDIA:
			printf("--- CÁLCULO DA MÉDIA ---\n");
			calcularMedias(arq);
			break;

		case EXPORTAR:
			printf("--- EXPORTAÇÃO DE DADOS ---\n");
			exportarDados(arq);
			break;

		case COMPACTAR:
			printf("--- COMPACTAÇÃO DE DADOS ---\n");
			compactarDados(arq, nome_arq);
			break;
	}

	return 0;
}

int procurarFuncionario(int id, FILE* arq) {
	funcionario f;
	while (fread(&f, sizeof(funcionario), 1, arq)) {
		// Já existe um ;)
		if (f.id == id) {
			printf("Funcionário já existente:\n");
			mostrarFuncionario(f);
			return 1;
		}
	}
	return 0; // Nao existe um usuario com esse id
}

FILE* abrirArquivo(char* nome_arq) {
	FILE* arq;
	// Append ++ leitura (binario)
	if ( (arq = fopen(nome_arq, "a+b") ) == NULL ) {
		return NULL;
	}

	return arq;
}

void mostrarFuncionario(funcionario f) {
	printf("| Id : %d\n| Nome: %s\n| Sexo = %c\n| Salário = %1.f\n", f.id, f.nome, f.sexo, f.salario);
}
