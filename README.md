# Octave_Numerical_ODE
Aplicação de algoritmos iterativos conhecidos para solução de EDO's usando o Octave.

## Uso
Clone este repositório, abra o Octave e vá para a pasta com
```
cd <caminho_da_sua_pasta>/src
```
Defina as equações diferenciais a serem calculadas, o tamanho e o número de passos e as condições iniciais da forma a seguir:
2. a)
```
syms y(x)
syms f(x)
f(x) = (1 - 2*exp(x)*y)*exp(-x)
g = @(x,y) (1 - 2*exp(x)*y)*exp(-x)
x0 = 0;
y0 = 1;
h = 0.5;
n = 5;
```

2. b)
```
syms y(x)
syms f(x)
f(x) = (sin(x)/x^2 - 3*y) / x
g = @(x,y) (sin(x)/x^2 - 3*y) / x
x0 = pi;
y0 = 1;
h = 1.0;
n = 5;
```

2. c)
```
syms y(x)
syms f(x)
f(x) = (cos(x))^2 - y*tan(x)
g = @(x,y) (cos(x))^2 - y*tan(x)
x0 = pi/8;
y0 = 1;
h = pi/16;
n = 5;
```

2. d)
```
syms y(x)
syms f(x)
f(x) = (1 -1/x -2*y) / x
g = @(x,y) (1 -1/x -2*y) / x
x0 = 1;
y0 = 1;
h = 0.1;
n = 5;
```

Invoque a função Q1 para obter os valores e gráficos pedidos:
```
[xA yA xN yN xPA yPA err errPADP] = Q1(f,g,x0,y0,h,n)
```

Onde
xA: x da solução analítica
yA: y da solução analítica
xN: x das soluções numéricas
yN: y das soluções numéricas
xPA: x do método de Dormand-Prince com passo adaptativo
yPA: y do método de Dormand-Prince com passo adaptativo
Note que xN e yN são matrizes e suas colunas representam (respectivamente) a solução pelo método:
	1. Euler
	2. Euler Melhorado
	3. Euler Modificado
	4. Wray
	5. Ralston
	6. Dormand-Prince usando os valores explícitos da matriz de Butcher
	7. Dormand-Prince com passo fixo

## TODO
* Ajustar o plot para o que foi pedido (marcar pontos, colocar legenda, ...)
* Montar as tabelas dos valores e print dos plots para relatório
* Questão 2
* Fazer o relatório
