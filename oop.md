# Preámbulo de programación orientada a objetos (OOP)

Antes de estudiar los bloques que componen el modelo de verificación es importante tener en cuenta los siguientes conceptos:

`Class`: Una clase es una abstracción de un objeto real, en ella se modelan las características del objeto. Las clases se componen de atributos y métodos.

`Attributes`: Son las variables que describen al objeto, los atributos pueden ser de diferentes tipos: `int`, `float`, `string`, `bit`, etc.

`Methods`: Los métodos son funciones disponibles para los objetos, los cuales pueden modificar sus valores.

`Constructor`: Es un método que se utiliza para inicializar los valores de los atributos. El constructor se ejecuta cuando se crea el objeto.

Un ejemplo de clase es el siguiente:

- Clase: Zapatos

- Atributos: 

| Atributo       | Tipo de dato |
| -------------- | ------------ |
| color          | `string`     |
| talla          | `float`      |
| tipo de zapato | `string`     |

- Métodos: Se puede utilizar el método constructor para inicializar los atributos anteriores.

Sintaxis de una clase:

```systemverilog
class <name_class>;
    //atributes
    //methods
    	//constructor
endclass
```



**Referencias**

[1] [Class Constructor Methods](https://uk.mathworks.com/help/matlab/matlab_oop/class-constructor-methods.html)

[2] [Classes and Objects in Object Oriented Programming](https://www.enjoyalgorithms.com/blog/classe-and-object-in-oops)

[3] [Clases (OOP)](https://brilliant.org/wiki/classes-oop/#:~:text=In%20object%2Doriented%20programming%2C%20a,(member%20functions%20or%20methods).)