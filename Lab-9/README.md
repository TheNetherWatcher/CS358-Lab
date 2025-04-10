# README - LEX Programs

## Description
This directory contains three LEX programs that solve the given assignment problems:
1. **Palindrome checker**: A simple program implemented in LEX and YACC that checks if input string is a palindrome or not.
2. **BODMAS rule evaluator**: Evaluates arithmetic expression using BODMAS rule.
3. **Word frequency counter**: A simple program implemented in LEX and YACC counts the occurrences of a specific word in an input statement.
4. **Grammar checker**: Checks if input string follows a particular grammar or not.

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

### Running the Palindrome checker
```bash
lex q1.l 
yacc -dy q1.y 
gcc lex.yy.c y.tab.c -w -o q1
./q1
```

### Running the BODMAS rule evaluator
```bash
lex q2.l 
yacc -dy q2.y 
gcc lex.yy.c -w -o q2
./q2
```

### Running the Word frequency counter
```bash
lex q3.l 
yacc -dy q3.y 
gcc lex.yy.c y.tab.c -w -o q3
./q3
```

### Running the Grammar checker
```bash
lex q4.l 
yacc -dy q4.y 
gcc lex.yy.c -w -o q4
./q4
```