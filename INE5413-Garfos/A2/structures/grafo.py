class Grafo:
	def __init__(self, dirigido):
		self.vertices = {}
		self.dirigido = dirigido

	def inserir_vertice(self, id_vertice, rotulo_vertice):
		self.vertices[id_vertice] = [rotulo_vertice]

	def inserir_aresta(self, vertice_u, vertice_v, peso):
		if (not self.dirigido):
			self.vertices[vertice_u].append( (vertice_v, peso) )
			self.vertices[vertice_v].append( (vertice_u, peso) )
		else:
			self.vertices[vertice_u].append( (vertice_v, peso) )

	def qtdVertices(self):
		return len(self.vertices)

	def qtdArestas(self):
		sum = 0
		for vertice in self.vertices:
			sum += len(self.vertices[vertice][1::])
		if (not self.dirigido):
			sum = int(sum/2)
		return sum

	def pegar_vertices(self):
		return list(self.vertices.keys())

	def pegar_arestas(self):
		arestas = []
		for v in self.vertices:
			for u in self.vizinhos(v):
				par = (v,u[0])
				arestas.append(par)
		return arestas

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

	def mostrar_grafo(self):
		vertices = list(self.vertices.keys())
		print('G: {')
		for v in vertices:
			print('	%s (%s): %s' % (v, self.vertices[v][0], self.vertices[v][1::]))
		print('}')

	def eh_conectado(self):
		v = random.choice(self.pegar_vertices())
		flag_visitado = True

		bfs = Algoritmo_bfs()
		Dv = bfs.buscar_em_largura(v, self)

		for dv in Dv:
			if (Dv[dv] == float('inf')):
				flag_visitado = False
		return flag_visitado

	def tem_grau_par(self):
		for v in self.pegar_vertices():
			if(self.grau(v) % 2 != 0):
				return False
		return True

if __name__ == "__main__":
	g = Grafo(False)
	g.inserir_vertice(0,0)
	g.inserir_vertice(1,1)
	g.inserir_vertice(2,2)

	g.inserir_aresta(0,1,1)
	g.inserir_aresta(0,2,1)
	g.inserir_aresta(1,2,1)
	g.inserir_aresta(2,2,1)
	print(g.pegar_arestas())


