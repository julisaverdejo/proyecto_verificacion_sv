# Cargar un archivo de texto a la clase generator.

Para cargar, leer y acceder a los valores de un archivo de texto en SystemVerilog se utilizan las siguientes funciones:

`$fopen`: Se utiliza para cargar y leer el archivo de texto.

 La manera de utilizarla es la siguiente:

1. Declarar una variable de tipo `int`.
2. Asignar la función `$fopen` a la variable.

Sintaxis:

```systemverilog
int variable_name;
variable_name = $fopen("file_name.txt", "r");
```

Los argumentos van dentro de comillas. El segundo argumento indica la operación que se le realizará al archivo, en este caso `"r"` (read) indica que el archivo de texto será leído.

 `$fscanf` : Con esta función se puede acceder a los valores del archivo. Es necesario declarar una variable para almacenar los valores del archivo de texto.

Sintaxis:

```systemverilog
$fscanf(variable_name, "data_type", save_variable);
```

`$feof`: Indica si se ha llegado al final del archivo y devuelve `True` si esto es cierto. Esta función generalmente se usa dentro de loops.

Sintaxis:

```systemverilog
$feof(variable_name)
```

 `$fclose`: Cierra el archivo y una vez que es cerrado ya no se puede acceder a sus valores.

Sintaxis: 

```systemverilog
$fclose(variable_name);
```

> Es importante cerrar los archivos para que otros bloques de código no tengan acceso a él y así evitar errores.

En el siguiente ejemplo se muestra como leer archivos de texto en SystemVerilog:

```systemverilog
module leer_archivo;

  // Declarar variables
  int valor;
  int file;

  // Abrir archivo
  initial begin
    file = $fopen("datos.txt", "r");
    if (file == 0) begin
      $display("Error al abrir el archivo.");
    end else begin
      // Leer archivo valor por valor
      while (!$feof(file)) begin
        $fscanf(file, "%d", valor);  // Leer un valor del archivo
        $display("Valor leido: %0d", valor);
      end
      // Cerrar archivo
      $fclose(file);
    end
  end
endmodule

```



> Nota: La lectura del archivo de texto en la clase generator debe ser dentro del main.



**Referencias**

[1] [ChipVerify: SystemVerilog file operations](https://www.chipverify.com/systemverilog/systemverilog-file-io#:~:text=To%20read%20a%20file%2C%20it,it%20will%20read%2010%20lines)

