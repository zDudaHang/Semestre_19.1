from grafo import GrafoND
import random

class Algoritmo_Hierholzer:
	def filtrar_nao_visitadas_grafo(self, visitados):
		dic_temporario = {key: value for key, value in visitados.items() if value == False}
		return list(dic_temporario)

	def filtrar_nao_visitadas_vertice(self, visitados, vertice):
		dic_temporario = {key: value for key, value in visitados.items() if value == False and key[0] == vertice}
		return list(dic_temporario)

	def encontrar_ciclo_euleriano(self, grafo):
		if (grafo.eh_conectado() and grafo.tem_grau_par()):
			
			visitados = {}
			ciclo = []

			arestas = grafo.pegar_arestas()

			for aresta in arestas:
				visitados[aresta] = False

			v = random.choice(grafo.pegar_vertices())

			retorno = self.encontrar_subciclo_euleriano(grafo, visitados, v, ciclo)

			if (retorno[0] == False):
				print("0")
				return (False, None)
			else:
				if (len(self.filtrar_nao_visitadas_grafo(visitados)) != 0):
					print("0")
					return(False, None)
				else:
					print("1")
					print(*retorno[1], sep = ", ")
					return (True, retorno[1])
		else:
			print("0")
			return (False, None)

	def encontrar_subciclo_euleriano(self, grafo, visitados, v, ciclo):
		referencia = v
		
		while True:
			ciclo.append(v)
			if (len(self.filtrar_nao_visitadas_vertice(visitados, v)) == 0):
				return (False,None)
			else:
				par = random.choice(self.filtrar_nao_visitadas_vertice(visitados,v))
				u = par[1]
				visitados[(v,u)] = True
				visitados[(u,v)] = True
				v = u

			if (referencia == v):
				ciclo.append(v)
				break

		for v in ciclo:
			if(len(self.filtrar_nao_visitadas_vertice(visitados, v)) != 0):
				ciclo_2 = []
				retorno = self.encontrar_subciclo_euleriano(grafo, visitados, v, ciclo_2)

				if (retorno[0] == False):
					return(False, None)
				else:
					ciclo = self.unir_subciclos(ciclo, ciclo_2)

		return (True, ciclo)

	def unir_subciclos(self, ciclo_1, ciclo_2):
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

if __name__ == "__main__":
	g = GrafoND()
	for i in range(0,9):
		g.inserir_vertice(i,i)

	g.inserir_aresta(0,1,1)
	g.inserir_aresta(0,2,1)
	g.inserir_aresta(1,2,1)

	g.inserir_aresta(1,3,1)
	g.inserir_aresta(1,4,1)
	g.inserir_aresta(3,4,1)

	g.inserir_aresta(4,5,1)
	g.inserir_aresta(4,6,1)
	g.inserir_aresta(6,5,1)

	g.inserir_aresta(6,7,1)
	g.inserir_aresta(6,8,1)
	g.inserir_aresta(7,8,1)

	h = Algoritmo_Hierholzer()
	h.encontrar_ciclo_euleriano(g)