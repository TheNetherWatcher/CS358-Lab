# README - LEX Programs

## Description
This directory contains three LEX programs that solve the given assignment problems:
1. **AB Validator LEX Program**: Validates if the string is of the form `A*B*` or not
2. **Mathematical expression LEX Program**: Counts occurrences of operands and operators, after validating them.

## Prerequisites
Ensure you have `lex`, `bison` and `gcc` installed. On Linux, you can install them using:
```bash
sudo apt-get install bison flex gcc 
```
On macOS:
```bash
brew install flex
```

## How to Run
Follow these steps for each LEX file:

### Running the AB Validator LEX Program
```bash
lex q1.l 
yacc -dy q1.y 
gcc lex.yy.c y.tab.c -w
./a.out
```

### Running the Mathematical expression LEX Program
```bash
lex q2.l 
yacc -dy q2.y 
gcc lex.yy.c y.tab.c -w
./a.out
```
