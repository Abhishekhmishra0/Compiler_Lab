#include <stdio.h>
#include <string.h>
#include<stdlib.h>

int i = 0;
char input[100];

void E();
void Ep();

void match(char c) {
    if(input[i] == c)
        i++;
    else {
        printf("Rejected\n");
        exit(0);
    }
}

void E() {
    if(input[i] == 'i') {   // id = 'i' simplified
        match('i');
        Ep();
    }
}

void Ep() {
    if(input[i] == '+') {
        match('+');
        match('i');
        Ep();
    }
    // ε → do nothing
}

int main() {
    printf("Enter input (use i for id, end with $): ");
    scanf("%s", input);

    E();

    if(input[i] == '$')
        printf("Accepted\n");
    else
        printf("Rejected\n");

    return 0;
}