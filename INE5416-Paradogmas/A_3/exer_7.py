numeros = input().split()

numeros = [int(x) for x in numeros]

print(list(map((lambda x: 'Par' if (x % 2 == 0) else 'Ímpar'),numeros)))
