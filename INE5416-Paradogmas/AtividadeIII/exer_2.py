a, b, c = input().split()

a = float(a)
b = float(b)
c = float(c)

nota = (lambda a,b,c: True if ((a+b+c)/3 >= 6) else False)

if (nota(a,b,c) == True):
	print('Aprovado')
else:
	print('Reprovado')