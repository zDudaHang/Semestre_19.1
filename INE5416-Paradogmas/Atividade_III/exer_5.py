print('Coloque todas as coordenadas dos dois pontos na mesma linha.')

coordenadas = input().split()

coordenadas = [int(x) for x in coordenadas]

ponto1 = coordenadas[0:3]
ponto2 = coordenadas[3:6]

delta = (lambda a,b: (a-b)**(2))
dist = (lambda ponto1, ponto2: delta(ponto2[0], ponto1[0]) + delta(ponto2[1], ponto1[1]) + delta(ponto2[2], ponto1[2]))
distancia = (lambda ponto1, ponto2: (dist(ponto1, ponto2))**(1/2))

print('Distância entre os pontos %s e %s = %.3f' % (ponto1, ponto2, distancia(ponto1, ponto2)))
