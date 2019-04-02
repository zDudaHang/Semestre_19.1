class Pessoa:
    # Construtor
    def __init__(self, idade, nome):
        self.idade = idade
        self.nome = nome

    def ver_nome(self):
        return self.name

    def ver_idade(self):
        return self.idade

eduardo = Pessoa(20, "Eduardo Oliveira")
print(eduardo.ver_nome()) # Eduardo Oliveria
print(eduardo.ver_idade())) # 20
