from queue import Queue

class Algoritmo_bfs:
	def buscar_em_largura(self, vertice_s, grafo):
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

	def filtrar_distancia(self, _distancia):
		_distancia = {}
		elementos = list(_distancia.keys())
		valores = list(_distancia.values())
		for valor in valores:
			_distancia[valor] = []
		for elemento in elementos:
			dv = _distancia[elemento]
			_distancia[dv].append(elemento)
		return _distancia

	def mostrar_distancia(self, _distancia):
		print(*_distancia, sep = ", ")

'''
g = GrafoND()
g.inserir_vertice(0,0)
g.inserir_vertice(1,1)
g.inserir_vertice(2,2)
g.inserir_vertice(3,3)

g.inserir_aresta(0,1,1)
g.inserir_aresta(0,2,1)
g.inserir_aresta(1,2,1)
g.inserir_aresta(3,3,1)

bfs = Algoritmo_bfs()
Dv = bfs.buscar_em_largura(0, g)
bfs.mostrar_Dv(bfs.filtrar_Dv(Dv))
'''