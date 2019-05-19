from grafo import GrafoND

class Algoritmo_Floyd_Warshall:

	def encontrar_caminhos_minimos(self, grafo):
		# Inicializacao
		dist = []
		pred = []

		num_vertices = grafo.qtdVertices()
		arestas = grafo.pegar_arestas()
		vertices = grafo.pegar_vertices()

		# Inicializacao das matrizes
		for i in range(0, num_vertices):
			dist.append([float('inf')]*num_vertices)
			pred.append([None]*num_vertices)

		# Associando os pesos para vertices vizinhos
		for aresta in arestas:
			u = aresta[0]
			v = aresta[1]
			dist[u-1][v-1] = grafo.peso(u,v)
			pred[u-1][v-1] = v-1

		# Colocando a diagonal como 0
		for v in vertices:
			dist[v-1][v-1] = 0
			pred[v-1][v-1] = v

		for k in range(0, num_vertices):
			for i in range(0, num_vertices):
				for j in range(0, num_vertices):
					if (dist[i][j] > dist[i][k] + dist[k][j]):
						dist[i][j] = dist[i][k] + dist[k][j]
						pred[i][j] = pred[i][k]


		self.mostrar_distancias(dist)
		return (dist, pred)

	def mostrar_distancias(self, dist):
		i = 0
		for distancia in dist:
			print("--> Distâncias de %d:" % (i+1))
			print(*distancia, sep = ", ")
			i+=1

