class Algoritmo_Floyd_Warshall:
	def encontrar_caminho_minimo(self, grafo):
		distancia = {}
		proximo = {}

		for v in grafo.pegar_vertices():
			distancia