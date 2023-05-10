# Octave_Numerical_ODE
Aplicação de algoritmos iterativos conhecidos para solução de EDO's usando o Octave.

## Uso
Clone este repositório, abra o Octave e vá para a pasta com
```
cd <caminho_da_sua_pasta>
```
A função Q1 recebe a função em formato simbólico e em função anônima e plota as curvas utilizando os métodos solicitados.
Para usar a função, abra o Octave e faça na linha de comando:
```
pkg load symbolic
syms x
syms y(x)
```
Leia o enunciado da questão e encontre a equação no formato canônico y' = f(x, y(x)). Ex:
1. a) e^x * y' + 2*e^x*y = 1 ===> y' = e^(-x) * (1 - 2*e^x*y)
Defina uma função simbólica "f" e uma anônima "g" que represente o lado direito da equação. Ex:
```
f = exp(-x)*(1-2*exp(x)*y(x))
g = @(x,y) exp(-x)*(1-2*exp(x)*y)
```
Escolha os parâmetros da simulação.
```
x0 = 0
y0 = 1
h = 0.5
n = 5
```
Invoque a função Q1
```
Q1(f,g,x0,y0,h,n)
```

## TODO
* Escrever os algoritmos de Dormand-Prince
* Ajustar o plot para o que foi pedido (marcar pontos, colocar legenda, ...)
* Fazer os gráficos de erro e montar as tabelas dos valores
* Questão 2
* Fazer o relatório
