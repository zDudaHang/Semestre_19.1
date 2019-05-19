from structures.grafo import Grafo
import src
from os import path

texto = ("Escolha uma das opções abaixo: \n" +
	"| 1 - Algoritmo BFS \n" +
	"| 2 - Algoritmo de Hielhozer\n" +
	"| 3 - Algoritm de Floyd-Warshall\n" +
	"| 4 - Algoritmo de Bellman Ford\n" +
	"| 5 - Sair\n"
	)

if __name__ == '__main__':

	filename = input("Digite o nome do arquivo")

	leitor = Leitor(filename)

    grafo = Grafo()
    grafo = leitor.ler()

    escolha = input(texto)

    


