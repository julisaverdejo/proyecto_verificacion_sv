# Representación en punto fijo

La representación de punto fijo de un número $X$ es $X(a,b)$ donde $a$ es la parte entera y $b$ es la parte fraccionaria. De manera que el número de bits en la representación es $a + b + 1$, es decir la parte entera más la parte fraccionaria más el bit de signo. El rango de valores que puede tomar es   $[-2^{a},2^{a}-2^{-b}]$. Por ejemplo:

| Número  | Conversión | Formato $X(a,b)$ | Rango $[-2^{a},2^{a}-2^{-b}]$ |
| ------- | ---------- | ---------------- | ----------------------------- |
| $01110$ | $3.5$      | $X(2,2)$         | $[-4,3.75]$                   |
| $10010$ | $-3.5$     | $X(2,2)$         | $[-4,3.75]$                   |
| $00011$ | $0.75$     | $X(2,2)$         | $[-4,3.75]$                   |



### Operaciones con punto fijo

**Suma**

Supóngase que se quiere sumar dos números $X(a,b)$ con el mismo formato de punto fijo, el número más grande que se puede tener en la suma se obtiene sumando los dos números más negativos, esto es:

<img src ="imagenes/ec1.svg" alt="mac" style="zoom:80%;" />

Esto quiere decir que para representar el resultado de la suma se necesita 1 bit más para la parte entera, es decir $X(a+1,b)$.

**Multiplicación**

En la multiplicación sucede algo parecido, el número más grande se obtiene multiplicando los números más negativos y los más positivos:

<img src ="imagenes/ec2.svg" alt="mac" style="zoom:80%;" />

Por lo tanto la representación en punto fijo del resultado es $X(2a+1,2b)$



**Referencias**

[1] [Engineering Applications of FPGAs, pp. 29-30](https://link.springer.com/book/10.1007/978-3-319-34115-6)















 