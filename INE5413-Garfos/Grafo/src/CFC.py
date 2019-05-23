import heapq
from grafo import Grafo
import random

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

	visitados_tranposto = {}
	tempos_inicias_transposto = {}
	tempos_finais_transposto = {}
	antecessores_transposto = {}
	resultado = dfs_cormen(grafo_tranposto)
	print(*resultado, sep = "\n")
	return resultado[2]
		

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

if __name__ == "__main__":

	g = Grafo(True)

	g.inserir_vertice(0,"under")
	g.inserir_vertice(1,"pants")
	g.inserir_vertice(2,"belt")
	g.inserir_vertice(3,"socks")
	g.inserir_vertice(4,"shoes")
	g.inserir_vertice(5,"shirt")
	g.inserir_vertice(6,"tie")
	g.inserir_vertice(7,"jacket")
	g.inserir_vertice(8, "watch")

	g.inserir_aresta(0,1,1)
	g.inserir_aresta(0,4,1)
	g.inserir_aresta(1,4,1)
	g.inserir_aresta(3,4,1)
	g.inserir_aresta(1,2,1)
	g.inserir_aresta(5,2,1)
	g.inserir_aresta(5,6,1)
	g.inserir_aresta(2,7,1)
	g.inserir_aresta(6,7,1)

	ordenacao_topologica(g)
	prim(g)

	g2 = Grafo(True)

	g2.inserir_vertice(0,0)
	g2.inserir_vertice(1,1)
	g2.inserir_vertice(2,2)
	g2.inserir_vertice(3,3)
	g2.inserir_vertice(4,4)
	g2.inserir_vertice(5,5)
	g2.inserir_vertice(6,6)
	g2.inserir_vertice(7,7)

	g2.inserir_aresta(0,1,1)
	g2.inserir_aresta(0,2,1)
	g2.inserir_aresta(1,3,1)
	g2.inserir_aresta(3,4,1)
	g2.inserir_aresta(5,6,1)
	
	cfc(g2)


