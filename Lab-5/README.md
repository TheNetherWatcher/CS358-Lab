# README - LEX Programs

## Description
This directory contains three LEX programs that solve the given assignment problems:
1. **Character Replacement LEX Program**: Replaces characters in the input based on an incrementing shift pattern.
2. **C Subroutine Analysis LEX Program**: Counts occurrences of `printf` and `scanf` statements in a given C subroutine.
3. **Number Classification LEX Program**: Counts occurrences of positive/negative integers and fractions in the input.

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

### Running the Character Replacement LEX Program
```bash
lex q1.l
gcc lex.yy.c -o q1 -ll
./q1
```
**Description:**
- Reads an input file (`input.txt`).
- Replaces each alphabetic character based on a shifting pattern.
- Writes the transformed output to `output.txt`.

### Running the C Subroutine Analysis LEX Program
```bash
lex q2.l
gcc lex.yy.c -o q2 -ll
./q2 
```
**Description:**
- Reads a C source file (`input.c`).
- Counts occurrences of `printf` and `scanf` statements.
- Prints the counts to the console.

### Running the Number Classification LEX Program
```bash
lex q3.l
gcc lex.yy.c -o q3 -ll
./q3 
```
**Description:**
- Reads a text file (`numbers.txt`) containing numbers.
- Identifies and counts positive/negative integers and fractions.
- Displays the counts in the terminal.