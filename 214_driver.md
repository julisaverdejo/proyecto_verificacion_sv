# Driver

En esta clase se realiza lo siguiente:

- Extrae la transaction del mailbox que se utiliza para comunicar el generator con el driver.

- Los atributos aleatorios (estímulos) dentro de la transaction son conectados al [**virtual interface**](virtual_interface.md).

- El driver se comunica con el DUT por medio del virtual interface, y lee los valores resultantes de la interacción de los estímulos con el DUT. 

- Este resultado se escribe en la transaction.

- Se despliega el resultado.

- Aumenta el contador de transacciones.

  

Sintaxis

```systemverilog
class driver;
    //declaracion_atributos;
    //constructor
    //reset task
    //main
    //incrementar_transacciones   
endclass
```



**Referencias**

[1] [Verification Guide: SystemVerilog TestBench Example 01](https://verificationguide.com/systemverilog-examples/systemverilog-testbench-example-01/)
