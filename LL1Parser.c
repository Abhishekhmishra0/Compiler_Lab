#include <stdio.h>
#include <string.h>

char stack[20];
char input[20];
int top = -1;

void push(char x) {
    stack[++top] = x;
}

void pop() {
    top--;
}

void display() {
    for(int i = top; i >= 0; i--)
        printf("%c", stack[i]);
}

int main() {
    int i = 0;
    
    // Input string (append $)
    strcpy(input, "i+i+i$");
    
    // Initialize stack
    push('$');
    push('E');

    printf("Stack\tInput\tAction\n");

    while(top != -1) {
        printf("\n");
        display();
        printf("\t%s\t", input + i);

        // Case 1: Match terminal
        if(stack[top] == input[i]) {
            printf("Match %c", input[i]);
            pop();
            i++;
        }
        else {
            // Apply productions
            if(stack[top] == 'E' && input[i] == 'i') {
                printf("E -> iE'");
                pop();
                push('\'');  // E'
                push('i');
            }
            else if(stack[top] == '\'' && input[i] == '+') {
                printf("E' -> +iE'");
                pop();
                push('\'');
                push('i');
                push('+');
            }
            else if(stack[top] == '\'' && input[i] == '$') {
                printf("E' -> ε");
                pop();
            }
            else {
                printf("Error");
                break;
            }
        }
    }

    if(input[i] == '\0' || input[i] == '$')
        printf("\n\nString Accepted\n");
    else
        printf("\n\nString Rejected\n");

    return 0;
}