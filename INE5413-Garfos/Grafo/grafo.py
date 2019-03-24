import os
from queue import Queue

class GrafoND:
	def __init__(self):
		self.vertices = {}

	def inserir_vertice(self, id_vertice, rotulo_vertice):
		self.vertices[id_vertice] = [rotulo_vertice]

	def inserir_aresta(self, vertice_u, vertice_v, peso):
		self.vertices[vertice_u].append( (vertice_v, peso) )
		self.vertices[vertice_v].append( (vertice_u, peso) )

	def qtdVertices(self):
		return len(self.vertices)

	def qtdArestas(self):
		sum = 0
		for vertice in self.vertices:
			sum += len(self.vertices[vertice][1::])
		return int(sum/2)

	def grau(self, vertice):
		return len(self.vertices[vertice][1::])

	def rotulo(self, vertice):
		return self.vertices[vertice][0]

	def vizinhos(self, vertice):
		return self.vertices[vertice][1::]

	def encontrar_tupla(self, vertice_u, vertice_v):
		vizinhos = self.vizinhos(vertice_u)
		for par in vizinhos[0::]:
			if (par[0] == vertice_v):
				return par
		return None

	def haAresta(self, vertice_u, vertice_v):
		par = self.encontrar_tupla(vertice_u, vertice_v)
		if (par != None):
			return True
		else:
			return False

	def peso(self, vertice_u, vertice_v):
		par = self.encontrar_tupla(vertice_u, vertice_v)
		if (par != None):
			return par[1]
		else:
			return float('inf')

	def pegar_vertices(self, texto, num_vertices):
		vertices = texto[1:num_vertices+1]
		for v in vertices:
			valores = v.split(' ',1)
			v_id = int(valores[0])
			v_rotulo = valores[1]
			self.inserir_vertice(v_id, v_rotulo)

	def pegar_arestas(self, texto, num_vertices):
		arestas = texto[num_vertices+2::]
		for a in arestas:
			valores = a.split()
			u = int(valores[0])
			v = int(valores[1])
			peso = float(valores[2])
			self.inserir_aresta(u, v, peso)

	def ler(self, nome_arquivo):
		texto = None
		# ==================================================================== ABRINDO ARQUIVO
		try:
			arquivo = open(nome_arquivo)
			texto = arquivo.read().split('\n')
			arquivo.close()
		except  OSError:
			print('Não foi possível abrir o arquivo %s' % nome_arquivo)
			arquivo.close()
		# ==================================================================== ABRINDO ARQUIVO
		#print(texto)
		info_num_vertices = texto[0].split()
		num_vertices = int(info_num_vertices[1])

		self.pegar_vertices(texto, num_vertices)

		self.pegar_arestas(texto, num_vertices)

	def mostrar_grafo(self):
		vertices = list(self.vertices.keys())
		print('G: {')
		for v in vertices:
			print('	%s (%s): %s' % (v, self.vertices[v][0], self.vertices[v][1::]))
		print('}')

	def buscar_largura(self, vertice_s):
		Cv = {}
		Dv = {}
		Av = {}
		vertices = list(self.vertices.keys())
		for v in vertices:
			Cv[v] = False
			Dv[v] = float('inf')
			Av[v] = None

		Cv[vertice_s] = True
		Dv[vertice_s] = 0

		queue = Queue()
		queue.enqueue(vertice_s)
		while (not queue.empty()):
			u = queue.dequeue()
			for tupla in self.vizinhos(u):
				w = tupla[0]
				if (Cv[w] == False):
					Cv[w] = True
					Dv[w] = Dv[u] + 1
					Av[w] = u
					queue.enqueue(w)
		self.mostrar_Dv(self.filtrar_Dv(Dv))

	def filtrar_Dv(self, Dv):
		_Dv = {}
		elementos = list(Dv.keys())
		valores = list(Dv.values())
		for valor in valores:
			_Dv[valor] = []
		for elemento in elementos:
			dv = Dv[elemento]
			_Dv[dv].append(elemento)
		return _Dv

	def mostrar_Dv(self, _Dv):
		for dv in _Dv:
			sorted_dv = _Dv[dv].sort()
			texto = ('%s: ' % dv)
			texto += ', '.join(str(vertice) for vertice in sorted_dv)
			print(texto)		







