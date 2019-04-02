x,y = input().split().lower()

if (x == "true"):
	x = True
else:
	x = False

if (y == "true"):
	y = True
else:
	y = False

xor = (lambda x,y: x ^ y)

print(xor(x,y))
