import random
from structures.grafo import Grafo

def cfc(G):
	C = {}
	T = {}
	F = {}
	A = {}

	(C, F, A, F) = dfsCormen(G)

	Gt = Grafo(True)

	for v in G.pegar_vertices():
		Gt.inserir_vertice(v, G.rotulo(v))

	for aresta in G.pegar_arestas():
		u = aresta[0]
		v = aresta[1]
		Gt.inserir_aresta(v, u, 1.0)

	resultado = dfsAdaptado(Gt, F)

	At = resultado[2]

	Arv = mostrarSubArvores(At, G)

	for raiz in list(Arv.keys()):
		if(Arv[raiz] != []):
			print(*Arv[raiz], sep = " , ")

	return At

def ordenacaoTopologica(G):
	C = {}
	T = {}
	F = {}
	A = {}

	vertices = G.pegar_vertices()

	for v in vertices:
		C[v] = False
		T[v] = float('inf')
		F[v] = float('inf')
		A[v] = None

	tempo = 0

	O = []

	for v in vertices:
		if (C[v] == False):
			dfsVisitOT(G, v, C, T, A, F, tempo, O)

	Orotulos = []

	for v in O:
		rotulo = G.rotulo(v)
		Orotulos.append(rotulo)

	print(*Orotulos, sep = " --> ")

	return O

def kruskal(G):
	A = {}
	S = []
	caminho = []
	for v in G.pegar_vertices():
		Sv = {v}
		S.append(Sv)

	E = G.pegar_arestas()
	E.sort(key=lambda a: G.peso(a[0],a[1]))

	for par in E:
		u = par[0]
		v = par[1]
		if (not set(S[u-1]) == set(S[v-1])):
			A = set.union(set(A), set(par))
			x = set.union(S[v-1], S[u-1])
			for w in x:
				S[w-1] = x
			caminho.append(par)
	soma = 0

	for par in caminho:
		u = par[0]
		v = par[1]
		soma += G.peso(u,v)

	print(soma)

	for i in range(0, len(caminho)):
		if(i == len(caminho) - 1):
			print(*caminho[i], sep = "-")
		else:
			print(*caminho[i], sep = "-", end='')
			print(", " , end='')

	return A

# ======================================================================= CFC

def mostrarSubArvores(A, G):
	Arv = {}

	for v in G.pegar_vertices():
		if(A[v] == None):
				Arv[v] = []

	for v in G.pegar_vertices():
		u = v

		if (A[v] == None):
			continue

		while(A[v] != None):
			antecessor = A[v]
			v = antecessor
		Arv[v].append(u)

	return Arv
		

def dfsCormen(G):
	C = {}
	T = {}
	F = {}
	A = {}

	vertices = G.pegar_vertices()

	for v in vertices:
		C[v] = False
		T[v] = float('inf')
		F[v] = float('inf')
		A[v] = None

	tempo = 0

	for v in vertices:
		if (C[v] == False):
			tempo = dfsVisit(G, v, C, T, A, F, tempo)
	return (C, T, A, F)

def dfsAdaptado(G, F):
	C = {}
	T = {}
	F2 = {}
	A = {}

	tempos = list(G.vertices)

	vertices = G.pegar_vertices()

	for v in vertices:
		C[v] = False
		T[v] = float('inf')
		F[v] = float('inf')
		A[v] = None

	tempo = 0

	tempos.sort(key=lambda v: F[v], reverse = True)

	for v in tempos:
		if (C[v] == False):
			dfsVisit(G, v, C, T, A, F2, tempo)
	return (C, T, A, F2)


def dfsVisit(G, v, C, T, A, F, tempo):
	C[v] = True
	tempo += 1
	T[v] = tempo
	for par in G.vizinhos(v):
		u = par[0]
		if (C[u] == False):
			A[u] = v
			tempo = dfsVisit(G, u, C, T, A, F, tempo)
	tempo += 1
	F[v] = tempo
	return tempo

# ======================================================================= CFC

# ======================================================================= ORDENACAO TOPOLOGICA

def dfsVisitOT(G, v, C, T, A, F, tempo, O):
	C[v] = True
	tempo += 1
	T[v] = tempo

	for par in G.vizinhos(v):
		u = par[0]
		if (C[u] == False):
			A[u] =  v
			dfsVisitOT(G, u, C, T, A, F, tempo, O)
	tempo += 1
	F[v] = tempo
	O.insert(0, v)

# ======================================================================= ORDENACAO TOPOLOGICA
