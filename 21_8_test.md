# Test

Un test en sytemverilog es considerado un wrapper[^1], en este bloque se conecta la interfaz y se incluye el environment, el cual puede ajustarse con diferentes parámetros de configuración. 

Sintaxis:

```systemverilog
program test();
    //declaracion de environment
    initial begin
        //creacion de environment
        //número de repeticiones de la transacción 
    end
endprogram
```



[^1]: Este término hace referencia a programas o códigos que encapsulan a otros componentes de programa. A menudo se usan para mejorar la compatibilidad o interoperabilidad entre diferentes estructuras de software. [1]

 

**Referencias**

[1] [Digital Guide IONOS: ¿Qué es un wrapper en programación? ](https://www.ionos.mx/digitalguide/paginas-web/desarrollo-web/que-es-un-wrapper/)

[2] [Chip Verify: SystemVerilog TestBench](https://www.chipverify.com/systemverilog/systemverilog-simple-testbench)
