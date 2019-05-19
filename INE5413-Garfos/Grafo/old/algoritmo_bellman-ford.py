from grafo import GrafoND

class Algoritmo_BellmanFord:
	def encontrar_caminho_minimo(self, grafo, vertice):
		distancia = {}
		antecessor = {}

		for v in grafo.pegar_vertices():
			distancia[v] = float('inf')
			antecessor[v] = None

		distancia[vertice] = 0

		for v in grafo.pegar_vertices():
			for par in grafo.vizinhos(v):
				u = par[0]
				if (distancia[v] > distancia[u] + grafo.peso(u,v)):
					distancia[v] = distancia[u] + grafo.peso(u,v)
					antecessor[v] = u

		for v in grafo.pegar_vertices():
			for par in grafo.vizinhos(v):
				u = par[0]
				if (distancia[v] > distancia[u] + grafo.peso(u,v)):
					return (False, None, None)

		antecessores = self.filtrar_antecessor(antecessor)

		self.mostrar_caminho_minimo(distancia, antecessores, vertice)

		return (True, distancia, antecessor)

	def filtrar_antecessor(self, antecessor):
		caminho = {}
		for v in antecessor:
			caminho[v] = []
			antecessor_v = antecessor[v]

			if (antecessor_v != None and antecessor[antecessor_v] != None):
				caminho[v].extend(caminho[antecessor_v])
			caminho[v].append(antecessor_v)

			if(antecessor_v == None):
				caminho[v] = [v]
		return caminho

	def mostrar_caminho_minimo(self, distancia, antecessores, vertice):
		for v in antecessores:
			lista_antecessores = list(antecessores[v])
			print("%s: %s; d=%s"%(v, lista_antecessores, distancia[v]))


