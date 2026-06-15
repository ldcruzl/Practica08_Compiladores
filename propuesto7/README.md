# Ejercicio 7 — Analizador con Flex y Bison

## Gramática (del Ejercicio 5)
```
S' → S
S  → C C
C  → c C | d
```

## Lenguaje que acepta
Cada C deriva en `c*d` (cero o más c's seguidas de una d).
S → CC genera cadenas de la forma: `(c*d)(c*d)`

| Cadena  | Resultado |
|---------|-----------|
| dd      | Aceptada  |
| cdd     | Aceptada  |
| cdcd    | Aceptada  |
| ccdd    | Aceptada  |
| cccdd   | No válida |
| ccccdd  | Aceptada  |
| cdc     | Rechazada |
| ccdc    | Rechazada |

## Compilación
```bash
bison -d parser.y
flex lexer.l
gcc lex.yy.c parser.tab.c -o parser -lfl
```

## Uso
```bash
./parser
```
Ingresa cadenas una por línea. `Ctrl+c` para salir.