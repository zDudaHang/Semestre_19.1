import random
import auxiliar_functions
from queue import Queue

def encontrar_ciclo_euleriano(grafo):
	if (grafo.eh_conectado() and grafo.tem_grau_par()):
	
		visitados = {}
		ciclo = []

		arestas = grafo.pegar_arestas()

		for aresta in arestas:
			visitados[aresta] = False

		v = random.choice(grafo.pegar_vertices())

		retorno = encontrar_subciclo_euleriano(grafo, visitados, v, ciclo)

		if (retorno[0] == False):
			print("0")
			return (False, None)
		else:
			if (len(filtrar_nao_visitadas_grafo(visitados)) != 0):
				print("0")
				return(False, None)

			else:
				print("1")
				print(*retorno[1], sep = ", ")
				return (True, retorno[1])
	else:
		print("0")
		return (False, None)

def encontrar_caminhos_minimos(grafo):
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

	mostrar_distancias(dist)
	return (dist, pred)

def buscar_em_largura(vertice_s, grafo):
	visitado = {}
	distancia = {}
	antecessor = {}

	vertices = list(grafo.vertices.keys())

	for v in vertices:
		visitado[v] = False
		distancia[v] = float('inf')
		distancia[v] = None

	visitado[vertice_s] = True
	distancia[vertice_s] = 0

	queue = Queue()
	queue.enqueue(vertice_s)
	while (not queue.empty()):
		u = queue.dequeue()
		for tupla in grafo.vizinhos(u):
			w = tupla[0]
			if (visitado[w] == False):
				visitado[w] = True
				distancia[w] = distancia[u] + 1
				antecessor[w] = u
				queue.enqueue(w)
	return distancia

def encontrar_caminho_minimo(grafo, vertice):
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

	antecessores = filtrar_antecessor(antecessor)

	mostrar_caminho_minimo(distancia, antecessores, vertice)

	return (True, distancia, antecessor)

