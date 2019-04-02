class Calculadora(objetc):

    @staticmethod
    def soma(a, b):
        return a + b
    @staticmethod
    def subtracao(a, b):
        return a - b
    @staticmethod
    def multiplicacao(a, b):
        return a * b
    @staticmethod
    def divisao(a, b):
        if (b != 0):
            return a/b
        else:
            print("Não é possível fazer divisão por zero")

print(Calculadora.soma(2,3))
print(Calculadora.subtracao(2,3))
print(Calculadora.multiplicacao(2,3))
print(Calculadora.divisao(2,3))
