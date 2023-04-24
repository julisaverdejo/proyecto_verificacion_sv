# Mailbox

Un mailbox es una forma que utilizan distintos procesos para comunicarse e intercambiar datos entre si.

En SystemVerilog un mailbox es una clase que cuenta con los siguientes métodos:

| Método             | Función                                           |
| ------------------ | ------------------------------------------------- |
| `new()`            | Crea un mailbox.                                  |
| `put()`            | Coloca un mensaje en un mailbox.                  |
| `get()` / `peek()` | Extrae un mensaje de un mailbox.                  |
| `num()`            | Devuelve cierto número de mensajes de un mailbox. |

**Tabla 1. Métodos de la clase mailbox**

Existen dos tipos de mailbox:

`Generic`: Acepta items de cualquier tipo de dato

Sintaxis:

```systemverilog
mailbox nombre_mailbox;
```



> Nota: Por default un mailbox es genérico.



`Parameterized`: Solo acepta items de un tipo de dato.

Sintaxis:

```systemverilog
mailbox #(tipo_dato) nombre_mailbox;
```



Y a su vez estos tipos pueden ser definidos como:

`Bounded`: Tiene un tamaño definido, por lo tanto sólo puede almacenar cierta cantidad de datos.

Sintaxis:

```systemverilog
mailbox nombre_mailbox = new(tamaño);
```



`Unbounded`: No tienen un tamaño definido.

Sintaxis:

```systemverilog
mailbox nombre_mailbox = new();
```



**Referencias**

[1] [Verification Guide: SystemVerilog Mailbox](https://verificationguide.com/systemverilog/systemverilog-mailbox/)

[2] [VLSI Verify: SystemVerilog Mailbox](https://vlsiverify.com/system-verilog/systemverilog-mailbox)



