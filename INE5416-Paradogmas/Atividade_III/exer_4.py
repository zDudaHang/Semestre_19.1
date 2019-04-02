a, b, c = input().split()

a = int(a)
b = int(b)
c = int(c)

if (a == 0):
	raise Exception('O coeficiente a não pode ser zero')
else:
	delta = (lambda a,b,c: ( (-4*a*c) + b*b )**(1/2) )
	raiz1 = (lambda a,b,c: ( (-b) + delta(a,b,c) )/(2*a) )
	raiz2 = (lambda a,b,c: ( (-b) - delta(a,b,c) )/(2*a) ) 


	print('x1 = %s \nx2 = %s' % (raiz1(a,b,c), raiz2(a,b,c)))