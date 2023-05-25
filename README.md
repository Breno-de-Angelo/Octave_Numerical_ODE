# Octave_Numerical_ODE
Aplicação de algoritmos iterativos conhecidos para solução de EDO's usando o Octave.

## Branch
A versão padrão do Octave para o Windows é a 8.1.0, enquanto que em sistemas Debian a instalação por apt package instala a versão 5.2.0. Isso pode causar alguns conflitos com relação a algumas funções (rhs() por exemplo). Para resolver esse problema, foram criadas duas branches. A branch main para a mais recente 8.1.0 e a branch 5.2.0 para a versão mais antiga (como o nome indica). Para identificar sua versão abra o Octave e execute
```octave
version
```
Caso a versão mais recente se assemelhe mais com a sua, clone o repositório normalmente. Caso contrário,
```
# LEIA AS LINHAS ACIMA
git clone -b 5.2.0 https://github.com/Breno-de-Angelo/Octave_Numerical_ODE
```

## Uso
Leia o item acima antes de prosseguir.
Com o repositório clonado, abra o Octave e vá para a pasta com
```
cd <caminho_da_sua_pasta>/src
```
Invoque a função main para obter os valores e gráficos pedidos:
```octave
main()
```

