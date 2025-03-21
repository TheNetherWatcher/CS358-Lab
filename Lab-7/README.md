# README - LEX Programs

## Description
This directory contains three LEX programs that solve the given assignment problems:
1. **Calculator LEX Program**: A simple calculator implemented using LEX and YACC that evaluates arithmetic expressions.
2. **Balanced Parentheses Checker LEX Program**: Checks if an input C program file has balanced parentheses (`()`) and braces (`{}`).
3. **Helping Verbs Identifier LEX Program**: Identifies and categorizes words in a sentence as helping verbs or not.

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

### Running the Calculator LEX Program
```bash
lex q1.l 
yacc -dy q1.y 
gcc lex.yy.c y.tab.c -w -o q1
./q1
```

### Running the Balanced Parentheses Checker LEX Program
```bash
lex q2.l 
yacc -dy q2.y 
gcc lex.yy.c y.tab.c -w -o q2
./q2
```
Here after the input is over, press Enter and the Ctrl+D so the program ends and gives output.

### Running the Helping Verbs Identifier LEX Program
```bash
lex q3.l 
yacc -dy q3.y 
gcc lex.yy.c y.tab.c -w -o q3
./q3
```