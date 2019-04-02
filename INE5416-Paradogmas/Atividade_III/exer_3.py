n = int(input())

fib = (lambda n: n if (n<2) else fib(n-1) + fib(n-2))

print('Fib(%s) = %s' % (n,fib(n)))