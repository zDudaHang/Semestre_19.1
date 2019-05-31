enum operacoes {
	INSERIR, // 0
	REMOVER, // 1
	MEDIA, // 2
	EXPORTAR, // 3
	COMPACTAR // 4
};

typedef struct {
	unsigned int id ;
	char nome[256];
	char sexo ;
	float salario ;
} funcionario;

void inserirFuncionario(FILE* arq);

void removerFuncionario(FILE* arq, char* nome_arq);

void calcularMedias(FILE* arq);

void exportarDados(FILE* arq);

void compactarDados(FILE* arq, char* nome_arq);

int procurarFuncionario(int id, FILE* arq);

FILE* abrirArquivo(char* nome_arq);

void mostrarFuncionario(funcionario f);

void mostrarOperacoes() {
	printf("Operações do sistema:\n");
	printf("| 0 : Inserir funcionário\n");
	printf("| 1 : Remover funcionário\n");
	printf("| 2 : Calcular a média de salários por sexo\n");
	printf("| 3 : Exportar os dados dos funcionários\n");
	printf("| 4 : Compactar a base de dados\n");
}