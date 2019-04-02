class Pessoa:
    # Construtor
    def __init__(self, idade, nome):
        self.idade = idade
        self.nome = nome

    def ver_nome(self):
        return self.name

    def ver_idade(self):
        return self.idade

class Empregado(Pessoa):
    # Construtor
    def __init__(self, idade, nome, salario):
        super().__init__(idade, nome)
        self.salario = salario

    def ver_salario(self):
        return self.salario

marcos = Empregado(35, "Marcos Silva", 570)
print(marcos.ver_nome()) # Marcos Silva
print(marcos.ver_idade()) # 35
print(marcos.ver_salario()) # 570
