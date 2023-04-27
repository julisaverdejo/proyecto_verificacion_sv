# Monitor

El monitor se encarga de crear una copia de las variables definidas en la interface, escribirlas en una transacción y guardar esta última en un mailbox, el cual será procesado por el scoreboard.

> Nota: Es importante tener una copia de la interface en caso de que el generador cambie de valores.

Sintaxis:

```systemverilog
class monitor;
    //declaracion de atributos
    //metodos:
    	//constructor
    	//main    
endclass
```



**Referencias**

[1] [Monitors – The eyes of a TestBench!](https://edvlearn.com/monitors-the-eyes-of-a-testbench/)

[2] [Verification Guide: SystemVerilog TestBench Example – with Scb](https://verificationguide.com/systemverilog-examples/systemverilog-testbench-example-with-scb/#Monitor)
