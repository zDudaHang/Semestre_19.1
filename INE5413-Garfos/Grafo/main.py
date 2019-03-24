from grafo import GrafoND
from queue import Queue
import time

def main():
	arquivo = input('Diga o nome do arquivo a ser lido: ')
	g = GrafoND()
	g.ler(arquivo)
	g.buscar_largura(1)
	#g.mostrar_grafo()

main()
