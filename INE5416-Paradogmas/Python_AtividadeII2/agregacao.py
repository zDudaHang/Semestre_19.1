class Produto:
    def __init__(self, nome, codigo, preco):
        self.nome = nome
        self.codigo = codigo
        self.preco = preco

    def printar_produto(self):
        print("Nome: %s Código: %s Preço: R$%.2f" % (self.nome, self.codigo, self.preco))

    def ver_preco(self):
        return self.preco

class Carrinho:
    produtos = []

    def __init__(self, produtos):
        i = 0
        self.produtos = produtos

    def adicionar_ao_carrinho(self, produto):
        produtos.append(produto)

    def contar_produtos(self):
        return len(produtos)

    def listar_produtos(self):
        for i in range(0, len(produtos)):
            produtos[i].printar_produto()

maionese = Produto("Maionese", 1, 2.50)
ketchup = Produto("Ketchup", 2, 3.00)
pao = Produto("Pão", 3, 1.50)

produtos = [maionese, ketchup, pao]
carrinho = Carrinho(produtos)
print(carrinho.contar_produtos())
print(carrinho.listar_produtos())
print(carrinho == None)
del carrinho
print(maionese == None)
print(ketchup == None)
print(pao == None)
#print(carrinho == None)
