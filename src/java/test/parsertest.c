/*
 * mini-c-test.c - A comprehensive test file for the given mini-C grammar
 */

#include "stdio.h"
#include "mydefs.h"

struct Point {
    int x;
    int y;
};

struct MyData {
    char c;
    struct Point p;
};

int doSomething(int param);      // Function declaration
void baz(int* ptr, char* msg);   // Another function declaration

struct MyData globalData;        // Global struct variable
int globalArray[2][3];           // Global multi-dimensional array

int main() {
    /* Declarations at the top of the block */
    int localVar;
    int localArray[5];
    struct Point localPoint;
    struct MyData anotherData;
    int *ptr;

    /* Statements */
    localVar = 10;
    localArray[0] = localVar;
    localArray[1] = localVar + 5;

    localPoint.x = 3;
    localPoint.y = 4;

    ptr = &localVar;    // Address-of
    *ptr = 20;          // Value-at (pointer indirection)

    /* if-else with a logical AND (&&) operator */
    if ((localVar > 15) && (localVar < 30)) {
        localVar = localVar + 1;
    } else {
        localVar = localVar - 1;
    }

    /* while loop with break and continue, using '!=' operator */
    while (localVar != 25) {
        localVar = localVar + 1;
        if (localVar == 22) {
            continue;
        }
        if (localVar == 24) {
            break;
        }
    }

    globalArray[1][2] = localVar;  // Multi-dimensional array access

    /* Function call with pointers and string literal */
    baz(&localVar, "Hello");

    /* Return with a type cast */
    return (int)'c';
}

int doSomething(int param) {
    /* Declarations at the top of the block */
    int localRes;

    /* Statements */
    localRes = param * 2;   // Simple arithmetic expression
    return localRes;
}

void baz(int* ptr, char* msg) {
    /* Declarations at the top of the block */
    int size;

    /* Statements */
    *ptr = *ptr + 5;             // Pointer indirection assignment

    doSomething(*ptr);           // Function call in an expression statement

    size = sizeof(struct MyData); // Using sizeof on a struct type

    /* Mixed arithmetic operators: +, -, *, /, % */
    size = size + 5 - 3 * 2 / 1 % 2;

    /* if statement without else */
    if (size > 10) {
        size = size - 10;
    }

    return;
}