# Interface

Es un bloque que encapsula en un solo puerto todas las entradas y salidas del dispositivo bajo prueba (DUT) que pueden ser controladas y supervisadas. Interface es usado para conectar el dispositivo con otros bloques empleados en la verificación.

Las ventajas de encapsular las entradas y salidas son:

- Reducir errores que pueden producirse durante las conexiones de los módulos

- Añadirse o eliminarse señales con facilidad.

Sintaxis:

```systemverilog
interface nombre_interface;
    ...
    declaracion_variables
    ...
endinterface
```



> Nota: 
>
> Un `interface` puede ser parametrizado con la directiva `parameter`.



**Referencias**

[1] [Duolos: SystemVerilog Interfaces Tutorial](https://www.doulos.com/knowhow/systemverilog/systemverilog-tutorials/systemverilog-interfaces-tutorial/)

[2] [ChipVerify: SystemVerilog Interface](https://www.chipverify.com/systemverilog/systemverilog-interface)

[3] [Verification Guide: SystemVerilog Interface Construct](https://verificationguide.com/systemverilog/systemverilog-interface-construct/)