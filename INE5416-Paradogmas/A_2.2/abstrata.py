from abc import ABC, abstractmethod

class Poligono(ABC):

    def __init__(self, vertices):
        self.vertices = vertices
        super().__init__()

    @abstractmethod
    def diz_vertices(self):
        pass

class Triangulo(Poligono):
    def diz_vertices(self):
        print(self.vertices)
    def calcula_area(self, base, altura):
        return (base*altura)/2

triangulo = Triangulo(3)
triangulo.diz_vertices()
print(triangulo.calcula_area(2,3))
