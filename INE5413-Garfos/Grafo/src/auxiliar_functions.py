

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