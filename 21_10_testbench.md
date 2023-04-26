# Testbench

Un testbench permite verificar el funcionamiento de un diseño aplicando estímulos a las entradas. En SystemVerilog la interfaz, el test y el dispositivo bajo prueba son instanciados.

La interfaz conecta al DUT y al testbench.

Sintaxis:

```systemverilog
module <nombre_testbench>;
    //declaracion de estimulos
    //declaracion de clock
    initial begin
        ...
    end
    //instanciacion de interfaz
    //instanciacion de test
    //instanciacion de DUT
endmodule
```



**Referencias**

[1] [Chip Verify: SystemVerilog TestBench](https://www.chipverify.com/systemverilog/systemverilog-simple-testbench)

[2] [Verification Guide: SystemVerilog TestBench Example 01](https://verificationguide.com/systemverilog-examples/systemverilog-testbench-example-01/#TestBench_Top)



