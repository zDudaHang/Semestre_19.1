import random
import heapq
from queue import Queue
from structures.grafo import Grafo

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

	print(mostrar_distancia(filtrar_distancia(distancia)))
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

def cfc(grafo):
	visitados = {}
	tempos_inicias = {}
	tempos_finais = {}
	antecessores = {}

	(visitados, tempos_finais, antecessores, tempos_finais) = dfs_cormen(grafo)

	antecessores_transposto = {}

	grafo_tranposto = Grafo(True)

	for v in grafo.pegar_vertices():
		grafo_tranposto.inserir_vertice(v, grafo.rotulo(v))

	for aresta in grafo.pegar_arestas():
		u = aresta[0]
		v = aresta[1]
		grafo_tranposto.inserir_aresta(v, u, 1.0)

	resultado = dfs_adaptado(grafo_tranposto, tempos_finais)

	At = resultado[2]

	Arv = mostrar_subArvores(At, grafo)

	print("Conjuntos obtidos:")
	for raiz in list(Arv.keys()):
		print("%d: " % raiz, end = '')
		print(*Arv[raiz], sep = " , ")

	return At

def ordenacao_topologica(grafo):
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

	ordem_topologica = []

	for v in vertices:
		if (visitados[v] == False):
			dfs_visit_ot(grafo, v, visitados, tempos_inicias, antecessores, tempos_finais, tempo, ordem_topologica)

	ordem_topologica_rotulos = []

	for v in ordem_topologica:
		rotulo = grafo.rotulo(v)
		index = ordem_topologica.index(v)
		ordem_topologica_rotulos.append(rotulo)

	print(*ordem_topologica_rotulos, sep = " --> ")

	return ordem_topologica

def prim(grafo):
	vertices = grafo.pegar_vertices()

	r = random.choice(vertices)

	print("Vértice escolhido: %d" % r)

	A = {}

	K = {}

	priorityQueue = []

	for v in vertices:
		A[v] = None
		K[v] = float('inf')

	K[r] = 0

	for v in vertices:
		par = (K[v],v)
		heapq.heappush(priorityQueue, par)

	heapq.heapify(priorityQueue)

	while (len(priorityQueue) != 0):
		menor = heapq.heappop(priorityQueue)
		for par in grafo.vizinhos(menor[1]):
			u = par[0]
			if (estaNaListaDaHeap(u, K[u],priorityQueue) and grafo.peso(menor[1],u) < K[u]):
				peso = grafo.peso(menor[1], u)
				A[u] = menor[1]
				index = priorityQueue.index( (K[u], u) )
				priorityQueue.pop(index)
				K[u] = peso
				priorityQueue.insert(index, (peso, u) )
				heapq.heapify(priorityQueue)

	print(mostrarSoma(K))
	print(mostrarArvore(A))

	return (A,K)


# ======================================================================= HIELHOZER

def filtrar_nao_visitadas_grafo(visitados):
	dic_temporario = {key: value for key, value in visitados.items() if value == False}
	return list(dic_temporario)

def filtrar_nao_visitadas_vertice(visitados, vertice):
	dic_temporario = {key: value for key, value in visitados.items() if value == False and key[0] == vertice}
	return list(dic_temporario)

def unir_subciclos(ciclo_1, ciclo_2):
	primeiro_c1 = ciclo_1[0]
	primeiro_c2 = ciclo_2[0]

	ocorrencias_2em1 = ciclo_1.count(primeiro_c2)
	ocorrencias_1em2 = ciclo_2.count(primeiro_c1)

	if (ocorrencias_1em2 == 1):
		indice = ciclo_2.index(primeiro_c1)
		ciclo_2[indice:indice+1] = ciclo_1
		return ciclo_2
	
	elif (ocorrencias_1em2 > 1):
		ciclo_2[-1:-1] = ciclo_1[:-1]
		return ciclo_2

	if (ocorrencias_2em1 == 1):
		indice = ciclo_1.index(primeiro_c2)
		ciclo_1[indice:indice+1] = ciclo_2
		return ciclo_1
	
	elif (ocorrencias_2em1 > 1):
		ciclo_1[-1:-1] = ciclo_2[:-1]
		return ciclo_1

def encontrar_subciclo_euleriano(grafo, visitados, v, ciclo):
	referencia = v
	
	while True:
		ciclo.append(v)
		if (len(filtrar_nao_visitadas_vertice(visitados, v)) == 0):
			return (False,None)
		else:
			par = random.choice(filtrar_nao_visitadas_vertice(visitados,v))
			u = par[1]
			visitados[(v,u)] = True
			visitados[(u,v)] = True
			v = u

		if (referencia == v):
			ciclo.append(v)
			break

		for v in ciclo:
			if(len(filtrar_nao_visitadas_vertice(visitados, v)) != 0):
				ciclo_2 = []
				retorno = encontrar_subciclo_euleriano(grafo, visitados, v, ciclo_2)

		if (retorno[0] == False):
			return(False, None)
		else:
			ciclo = unir_subciclos(ciclo, ciclo_2)

	return (True, ciclo)

# ======================================================================= HIELHOZER

# ======================================================================= FLOYD WARHSALL

def mostrar_distancias(dist):
		i = 0
		for distancia in dist:
			print("--> Distâncias de %d:" % (i+1))
			print(*distancia, sep = ", ")
			i+=1

# ======================================================================= FLOYD WARHSALL

# ======================================================================= BFS

def filtrar_distancia(_distancia):
	distancia = {}
	elementos = list(_distancia.keys())
	valores = list(_distancia.values())
	for valor in valores:
		_distancia[valor] = []
	for elemento in elementos:
		dv = _distancia[elemento]
		_distancia[dv].append(elemento)
	return _distancia

def mostrar_distancia(_distancia):
	print(*_distancia, sep = ", ")

# ======================================================================= BFS

# ======================================================================= BELLMAN FORD

def filtrar_antecessor(antecessor):
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

def mostrar_caminho_minimo(distancia, antecessores, vertice):
	for v in antecessores:
		lista_antecessores = list(antecessores[v])
		print("%s: %s; d=%s"%(v, lista_antecessores, distancia[v]))

# ======================================================================= BELLMAN FORD

# ======================================================================= CFC

def mostrar_subArvores(antecessores, grafo):
	Arv = {}

	for v in grafo.pegar_vertices():
		if(antecessores[v] == None):
				Arv[v] = []

	for v in grafo.pegar_vertices():
		u = v

		if (antecessores[v] == None):
			continue

		while(antecessores[v] != None):
			antecessor = antecessores[v]
			v = antecessor
		Arv[v].append(u)

	return Arv
		

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
			dfs_visit(grafo, v, visitados, tempos_inicias, antecessores, tempos_finais, tempo)

	return (visitados, tempos_inicias, antecessores, tempos_finais)

def dfs_adaptado(grafo, F):
	visitados = {}
	tempos_inicias = {}
	tempos_finais = {}
	antecessores = {}

	tempos = list(grafo.vertices)

	vertices = grafo.pegar_vertices()

	for v in vertices:
		visitados[v] = False
		tempos_inicias[v] = float('inf')
		tempos_finais[v] = float('inf')
		antecessores[v] = None

	tempo = 0

	tempos.sort(key=lambda v: F[v], reverse = True)

	for v in tempos:
		if (visitados[v] == False):
			dfs_visit(grafo, v, visitados, tempos_inicias, antecessores, tempos_finais, tempo)

	return (visitados, tempos_inicias, antecessores, tempos_finais)


def dfs_visit(grafo, vertice_v, visitados, tempos_inicias, antecessores, tempos_finais, tempo):
	visitados[vertice_v] = True
	tempo += 1
	tempos_inicias[vertice_v] = tempo
	for par in grafo.vizinhos(vertice_v):
		u = par[0]
		if (visitados[u] == False):
			antecessores[u] = vertice_v
			dfs_visit(grafo, u, visitados, tempos_inicias, antecessores, tempos_finais, tempo)
	tempo += 1
	tempos_finais[vertice_v] = tempo

# ======================================================================= CFC

# ======================================================================= ORDENACAO TOPOLOGICA

def dfs_visit_ot(grafo, vertice_v, visitados, tempos_inicias, antecessores, tempos_finais, tempo, ordem_topologica):
	visitados[vertice_v] = True
	tempo += 1
	tempos_inicias[vertice_v] = tempo

	for par in grafo.vizinhos(vertice_v):
		u = par[0]
		if (visitados[u] == False):
			antecessores[u] =  vertice_v
			dfs_visit_ot(grafo, u, visitados, tempos_inicias, antecessores, tempos_finais, tempo, ordem_topologica)

	tempo += 1
	tempos_finais[vertice_v] = tempo
	ordem_topologica.insert(0, vertice_v)

# ======================================================================= ORDENACAO TOPOLOGICA

# ======================================================================= PRIM

def mostrarSoma(lista_chaves):
	soma = 0
	for chave in lista_chaves:
		if chave != float('inf'):
			soma += chave
	return soma

def mostrarArvore(A):
	caminho = []
	for v in list(A.keys()):
		if(A[v] != None):
			caminho.append((A[v],v))
	return caminho

def estaNaListaDaHeap(vertice_u, chave_k, lista_heap):
	return (chave_k, vertice_u) in lista_heap

def mostrarOrdemTopologica(ordem_topologica, grafo):
	print(*ordem_topologica, sep = " --> ")

# ======================================================================= PRIM
