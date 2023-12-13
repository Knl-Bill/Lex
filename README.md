# Lex
## Table of Contents

1. [Introduction](#introduction)
2. [What is Lex?](#what-is-lex)
3. [How to Write Lex Programs](#how-to-write-lex-programs)
4. [How to Run Lex Programs](#how-to-run-lex-programs)
5. [Contributing](#contributing)

## Introduction

The repository contains a collection of Lex programs, also known as lexical analyzers, designed to generate lexical analyzers for various applications. Lex is a powerful tool for generating lexical analyzers (scanners) for processing text-based data.

Lex programs are often used in conjunction with the yacc parser generator to create complete compiler front-ends for programming languages. Lex helps identify and recognize patterns in input streams, making it an essential tool in the development of language processors.

## What is Lex?

Lex is a lexical analyzer generator. It generates C code for lexical analyzers based on regular expressions. Lex is commonly used in combination with the yacc parser generator to create compilers and interpreters.

In simple terms, Lex helps break down an input stream into tokens, making it easier to process and analyze the structure of the input data.

## How to Write Lex Programs

Writing Lex programs involves defining regular expressions that describe the patterns of interest in the input. Each pattern is associated with a specific action that is executed when the pattern is matched. Lex uses a simple syntax for specifying patterns and corresponding actions.

Here's a basic example of a Lex program:

```lex
%{
#include <stdio.h>
%}

%%
[0-9]+      { printf("Number: %s\n", yytext); }
[a-zA-Z]+   { printf("Word: %s\n", yytext); }
.           { /* Ignore other characters */ }

%%

int main() {
    yylex();
    return 0;
}
```

In this example, the Lex program recognizes and prints numbers and words from the input.

## How to Run Lex Programs

To generate the C code from a Lex program, you need to use the Lex compiler. Assuming you have Lex installed, you can run the following commands:

```bash
lex your_program.l
gcc lex.yy.c -o lexer -ll
./lexer input_file.txt
```

Replace `your_program.l` with the name of your Lex program file and `input_file.txt` with the name of the input file you want to process.

## Contributing

Feel free to contribute your Lex programs to this repository! Whether it's a simple example or a more complex application, your contributions can help others learn and explore the capabilities of Lex.
