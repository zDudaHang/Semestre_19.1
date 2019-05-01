module Main (main) where

import Formas

import Pontos

import Arvores

main = do
 print (area (Retangulo 5 2))
 print (area (Circulo 1))
 print (area (Trapezio 5 5 1))
--------------------------------------
 print (distancia (Ponto2D (0,0)) (Ponto2D (5,2)))
 print (colineares (Ponto2D (0,5)) (Ponto2D (1,3)) (Ponto2D (2,1)))
 print (formaTriangulo (Ponto2D (0,0)) (Ponto2D (1,2)) (Ponto2D (0,0)))
 --------------------------------------
 putStrLn (show (somaElementos minhaArvore))
 putStrLn (show (buscaElemento minhaArvore 30))
 putStrLn (show (buscaElemento minhaArvore 55))
 putStrLn (show (minimoElemento minhaArvore))
 putStrLn "OcorrenciasElemento: "
 putStrLn (show (ocorrenciasElemento minhaArvore 55))
 putStrLn "MaioresQueElemento: "
 putStrLn (show (maioresQueElemento minhaArvore 2))
 putStrLn "mediaElementos: "
 putStrLn (show (mediaElementos minhaArvore))
 putStrLn "elementos: "
 putStrLn (show (elementos minhaArvore))