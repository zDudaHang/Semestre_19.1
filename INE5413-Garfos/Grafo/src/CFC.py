import heapq as heap

def cfc(grafo):
	visitados = {}
	tempos_inicias = {}
	tempos_finais = {}
	antecessores = {}

	(visitados, tempos_finais, antecessores, tempos_finais) = dfs_cormen(grafo)

	antecessores_transposto = {}

	grafo_tranposto = Grafo(True)

	for v in grafo.pegar_vertices():
		grafo_tranposto.inserir_vertice(v)

	for aresta in grafo.pegar_arestas():
		u = aresta[0]
		v = aresta[1]
		grafo_tranposto.inserir_aresta(v, u, 1.0)

	visitados_tranposto = {}
	tempos_inicias_transposto = {}
	tempos_finais_transposto = {}
	antecessores_transposto = {}
	(visitados_tranposto, tempos_inicias_transposto, antecessores_transposto, tempos_finais_transposto) = dfs_visit(grafo_tranposto)

	return antecessores_transposto
		

def dfs_cormen(grafo):
	visitados = {}
	tempos_inicias = {}
	tempos_finais = {}
	antecessores = {}

	vertices = grafo.pegar_vertices()

	for v in vertices:
		visitados[v] = False
		tempos_inicias[v] = float('inf')
		tempos_finais[v] = float('inf')
		antecessores[v] = None

	tempo = 0

	for v in vertices:
		if (visitados[v] == False):
			visitados[v] = True
			dfs_visit(grafo, v, visitados, tempos_inicias, antecessores, tempos_finais, tempo)

	return (visitados, tempos_inicias, antecessores, tempos_finais)

def dfs_visit(grafo, vertice_v, visitados, tempos_inicias, antecessores,  tempos_finais, tempo):
	visitados[vertice_v] = True
	tempo++
	tempos_inicias[vertice_v] = tempo
	for u in grafo.vizinhos(vertice_v):
		if (visitados[u] == False):
			antecessores[u] = vertice_v
			dfs_visit(grafo, u, visitados, tempos_inicias, antecessores, tempos_finais, tempo)
	tempo++
	tempos_finais[vertice_v] = tempo

def ordenacao_topologica(grafo):
	visitados = {}
	tempos_inicias = {}
	tempos_finais = {}
	antecessores = {}

	for v in vertices:
		visitados[v] = False
		tempos_inicias[v] = float('inf')
		tempos_finais[v] = float('inf')
		antecessores[v] = None

	tempo = 0

	ordem_topologica = []

	vertices = grafo.pegar_vertices()

	for v in vertices:
		if (visitados[v] == False):
			dfs_visit_ot(grafo, v, visitados, tempos_inicias, antecessores. tempos_finais, tempo, ordem_topologica)

	return ordem_topologica

def dfs_visit_ot(grafo, vertice_v, visitados, tempos_inicias, antecessores, tempos_finais, tempo, ordem_topologica):
	visitados[vertice_v] = True
	tempo++
	tempos_inicias[vertice_v] = tempo

	for u in grafo.vizinhos(vertice_v):
		if (visitados[u] == False):
			antecessores[u] =  vertice_v
			dfs_visit(grafo, u, visitados, tempos_inicias, antecessores, tempos_finais, tempo)

	tempo++
	tempos_finais[vertice_v] = tempo
	ordem_topologica.insert(0, vertice_v)

# heapq.heappushpop(heap, item)
# heapq.heapify(x)

def kruskal(grafo):
	arestas = grafo.pegar_arestas()
	vertices = grafo.pegar_vertices()

	A = []
	S = {}

	heap = []
	pesos = []

	for v in vertices:
		S[v].insert(0,v)

	for aresta in arestas:
		u = aresta[0]
		v = aresta[1]

		peso = grafo.peso(u,v)

		pesos[(u,v)] = peso

		heapq.heappush(heap, peso)

	while(True):
		if (len(heap) == 0):
			break
		min_peso = heapq.heappop(heap)
		aresta_min 
# >>> heap = []
# >>> data = [(1, 'J'), (4, 'N'), (3, 'H'), (2, 'O')]
# >>> for item in data:
# ...     heappush(heap, item)
# ...
# >>> while heap:
# ...     print(heappop(heap)[1])
# J
# O
# H
# N






