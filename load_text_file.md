# Cargar un archivo en SV.

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



Ejemplo 2: Sumador

La lectura del archivo de texto en la clase generator debe ser dentro del main.

> Nota: El archivo a tiene los números del 1-10 y el b del 2-11.

``` systemverilog
class generator;// (mailbox gen2driv)
   
  //declaring transaction class
  transaction trans;
  //rand transaction trans; 
  //declaring mailbox
  mailbox gen2driv; 
  //repeat count, to specify number of items to generate
  int  repeat_count;
  
  //event, to indicate the end of transaction generation
  event ended;
  
  //-------------constructor------------
  function new(mailbox gen2driv);
    //getting the mailbox handle from env
    this.gen2driv = gen2driv;
  endfunction
//---------------main task, generates(create and randomizes) 
//the repeat_count number of transaction packets and puts into mailbox
  task main();
    int fd1;
    int fd2;
    int idxa;
    int idxb;
    fd1 = $fopen("data1.txt", "r");
    fd2 = $fopen("data2.txt", "r");
    repeat(repeat_count) begin
      trans = new();
      $fscanf(fd1, "%d", idxa);
      $fscanf(fd2, "%d", idxb);
      trans.a = idxa;
      trans.b = idxb;
      trans.display("[ GENERATOR ]");
      gen2driv.put(trans);
    end
    -> ended; //triggering indicates the end of generation
    $fclose(fd1);
    $fclose(fd2);
  endtask 
endclass

```

Resultados:

```plain
# KERNEL: [ DRIVER ] ----- Reset Started -----
# KERNEL: [ DRIVER ] ----- Reset Ended   -----
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 2, b = 1
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 3, b = 2
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 4, b = 3
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 5, b = 4
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 6, b = 5
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 7, b = 6
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 8, b = 7
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 9, b = 8
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 10, b = 9
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ GENERATOR ] 
# KERNEL: -------------------------
# KERNEL: - a = 11, b = 10
# KERNEL: - c = 0
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 2, b = 1
# KERNEL: - c = 3
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 2, b = 1
# KERNEL: - c = 3
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 2, b = 1
# KERNEL: - c = 3
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 3, b = 2
# KERNEL: - c = 5
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 3, b = 2
# KERNEL: - c = 5
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 3, b = 2
# KERNEL: - c = 5
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 4, b = 3
# KERNEL: - c = 7
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 4, b = 3
# KERNEL: - c = 7
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 4, b = 3
# KERNEL: - c = 7
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 5, b = 4
# KERNEL: - c = 9
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 5, b = 4
# KERNEL: - c = 9
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 5, b = 4
# KERNEL: - c = 9
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 6, b = 5
# KERNEL: - c = 11
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 6, b = 5
# KERNEL: - c = 11
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 6, b = 5
# KERNEL: - c = 11
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 7, b = 6
# KERNEL: - c = 13
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 7, b = 6
# KERNEL: - c = 13
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 7, b = 6
# KERNEL: - c = 13
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 8, b = 7
# KERNEL: - c = 15
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 8, b = 7
# KERNEL: - c = 15
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 8, b = 7
# KERNEL: - c = 15
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 9, b = 8
# KERNEL: - c = 17
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 9, b = 8
# KERNEL: - c = 17
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 9, b = 8
# KERNEL: - c = 17
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 10, b = 9
# KERNEL: - c = 19
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 10, b = 9
# KERNEL: - c = 19
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 10, b = 9
# KERNEL: - c = 19
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ DRIVER ] 
# KERNEL: -------------------------
# KERNEL: - a = 11, b = 10
# KERNEL: - c = 21
# KERNEL: -------------------------
# KERNEL: -------------------------
# KERNEL: - [ Monitor ] 
# KERNEL: -------------------------
# KERNEL: - a = 11, b = 10
# KERNEL: - c = 21
# KERNEL: -------------------------
# KERNEL: Result is as Expected
# KERNEL: -------------------------
# KERNEL: - [ Scoreboard ] 
# KERNEL: -------------------------
# KERNEL: - a = 11, b = 10
# KERNEL: - c = 21
# KERNEL: -------------------------
```





**Referencias**

[1] [ChipVerify: SystemVerilog file operations](https://www.chipverify.com/systemverilog/systemverilog-file-io#:~:text=To%20read%20a%20file%2C%20it,it%20will%20read%2010%20lines)

