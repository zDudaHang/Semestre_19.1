numeros = input().split()

numeros = [int(x) for x in numeros]

maior = (lambda a,b: a if a > b else b)

print(maior(maior(numeros[0], numeros[1]), numeros[2]))