from grafo import Grafo
import os

class Leitor:

	def __init__(self, nome_arquivo):
		self.arquivo = nome_arquivo

	def ler(self):
		texto = None
		# ==================================================================== ABRINDO ARQUIVO
		try:
			arquivo = open(self.arquivo)
			texto = arquivo.read().split('\n')
			arquivo.close()
		except  OSError:
			print('Não foi possível abrir o arquivo %s' % self.arquivo)
			arquivo.close()
		# ==================================================================== ABRINDO ARQUIVO
		
		info_num_vertices = texto[0].split()
		num_vertices = int(info_num_vertices[1])

		dirigido = False
		if '*arcs' in open(self.arquivo).read():
			dirigido = True

		grafo = Grafo(dirigido)

		self.pegar_vertices(texto, num_vertices, grafo)
		self.pegar_arestas(texto, num_vertices, grafo)

		return grafo

	def pegar_vertices(self, texto, num_vertices, grafo):
		vertices = texto[1:num_vertices+1]
		for v in vertices:
			valores = v.split(' ',1)
			v_id = int(valores[0])
			v_rotulo = valores[1]
			grafo.inserir_vertice(v_id, v_rotulo)

	def pegar_arestas(self, texto, num_vertices, grafo):
		arestas = texto[num_vertices+2::]
		for a in arestas:
			valores = a.split()
			u = int(valores[0])
			v = int(valores[1])
			peso = float(valores[2])
			grafo.inserir_aresta(u, v, peso)