# Practica 3 - Implementacion LR con Bison

# Descripcion

Implementación de un analizador sintáctico LR utilizando Flex y Bison. 
El programa reconoce expresiones aritméticas formadas por identificadores, operadores de suma y multiplicación, además del uso de paréntesis.

# Archivos:
- **lexer.l:** Analizador lexico
- **parser.y:** Analizador sintactico
---

# Compilacion:
```bash
bison -d parser.y
flex lexer.l
gcc lex.yy.c parser.tab.c -o parser
```

# Ejemplos:

```text
a+b
a+b*c
(a+b)*c
```