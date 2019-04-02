class Animal:
    def __init__(self, nome):
        self.nome = nome

    def dormir(self):
        print("O(A) %s está dormindo..." % self.nome)

    def comer(self, comida):
        print("Comendo...")

class Carnivoro(Animal):
    def __init__(self, nome):
        super().__init__(nome)

    def comer(self, comida):
        if (comida == "carne"):
            print("O(A) %s está comendo carne..." % self.nome)
        else:
            print("O(A) %s somente come carne" % self.nome)

    def cacar_animais(self):
        print("%s está caçando..." % self.nome)

class Herbivoro(Animal):
    def __init__(self, nome):
        super().__init__(nome)
    def comer(self, comida):
        if (comida == "vegetal"):
            print("O(A) %s está comendo um vegetal..." % self.nome)
        else:
            print("O(A) %s somente come vegetais" % self.nome)

    def procurar_vegetais(self):
        print("%s está procurando vegetais..." % self.nome)

class Onivoro(Carnivoro, Herbivoro):
    def __init__(self, nome):
        super().__init__(nome)

    def comer(self, comida):
        if (comida =="vegetal" or comida=="carne"):
            print("O(A) %s está comendo..." % self.nome)
        else:
            print("O(A) %s não come %s" % (self.nome, comida))

urso = Onivoro("urso")
urso.dormir()
urso.comer("carne")
urso.comer("fruta")
urso.comer("vegetal")
urso.cacar_animais()
urso.procurar_vegetais()

leao = Carnivoro("leão")
leao.dormir()
leao.comer("carne")
leao.comer("fruta")

alce = Herbivoro("alce")
alce.dormir()
alce.comer("vegetal")
alce.comer("carne")
