from grafo import GrafoND
from queue import Queue
import time

def main():

	arquivo = input('Diga o nome do arquivo a ser lido: ')
	leitor = Leitor(arquivo)
	grafo = leitor.ler()

	bfs = BFS()
	bfs.buscar_em_largura(grafo)

main()
