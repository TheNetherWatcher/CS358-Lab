# README - LEX Programs

## Description
This directory contains three LEX programs that solve the given assignment problems:
1. **Infix to Postfix converter**: A simple program implemented in LEX and YACC that converts Infix Expression(1+2), to PostFix expressions(1 2 +).
2. **Binary to Decimal Converter**: Converts a binary input to decimal output.

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

### Running the Infix to Postfix converter
```bash
lex q1.l 
yacc -dy q1.y 
gcc lex.yy.c y.tab.c -w -o q1
./q1
```

### Running the inary to Decimal Converter
```bash
lex q2.l 
yacc -dy q2.y 
gcc lex.yy.c -w -o q2
./q2
```