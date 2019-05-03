from abc import ABC, abstractmethod

class Poligono(ABC):

    def __init__(self, vertices):
        self.vertices = vertices
        super().__init__()

    @abstractmethod
    def diz_vertices(self):
        pass

class Triangulo(Poligono):
    pass
    
x = Triangulo(3)
