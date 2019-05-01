data Dia = Domingo 
 | Segunda 
 | Terca 
 | Quarta 
 | Quinta 
 | Sexta 
 | Sabado 
 deriving(Eq, Show)

data Mes = Janeiro
 | Fevereiro
 | Marco
 | Abril
 | Maio
 | Junho
 | Julho
 | Agosto
 | Setembro
 | Outubro
 | Novembro
 | Dezembro
 deriving (Eq,Show,Enum)

dia :: Int -> Dia
dia num | (num == 1) = Domingo
 | (num == 2) = Segunda
 | (num == 3) = Terca
 | (num == 4) = Quarta
 | (num == 5) = Quinta
 | (num == 6) = Sexta
 | (num == 7) = Sabado

main = do 
 print([Janeiro ..])
 print(map fromEnum [Janeiro ..])
 let l = [1..7]
 print(map dia l)