# Lab 4 - Flex Programs

This folder contains two Flex programs that demonstrate lexical analysis:

## Programs

### 1. Word Counter (q2.l)
Counts the number of words in user input.

To compile and run:
```bash
flex q2.l
gcc lex.yy.c -o word_count
./word_count
```

### 2. Comment Counter (q3.l)
This program counts the number of comments that is present in the given C file that is given in the input

To compile and run:
```bash
flex q3.l
gcc lex.yy.c -o comment_count
./comment_count test.c
```