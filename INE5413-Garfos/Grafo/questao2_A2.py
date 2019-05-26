from structures.grafo import Grafo
from src.leitor import *
from src.functions import *
from sys import argv
from os import path

if __name__ == '__main__':
	if len(argv) < 2:
		print('Utilização correta: python questao1_A2.py <arquivo_descrevendo_grafo>')
		exit()

	arquivo = argv[1]
	if not path.isfile(arquivo):
		print('Arquivo não encontrado :/')
		exit()

	leitor = Leitor(arquivo)

	grafo = leitor.ler()

	print("Resultado do Algoritmo de Ordenação Topológica:\n")

	ordenacao_topologica(grafo)