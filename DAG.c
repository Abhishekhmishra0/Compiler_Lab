#include <stdio.h>
#include <string.h>

struct node {
    char result;
    char left;
    char right;
    char op;
};

int main() {
    struct node n[20];
    int i, j, count;

    printf("Enter number of expressions: ");
    scanf("%d", &count);

    for (i = 0; i < count; i++) {
        printf("Enter expression (a=b+c): ");
        scanf(" %c=%c%c%c", &n[i].result, &n[i].left, &n[i].op, &n[i].right);
    }

    printf("\nDAG Representation:\n");

    for (i = 0; i < count; i++) {
        int found = 0;

        for (j = 0; j < i; j++) {
            if (n[i].left == n[j].left &&
                n[i].right == n[j].right &&
                n[i].op == n[j].op) {

                printf("%c = %c (reused)\n", n[i].result, n[j].result);
                found = 1;
                break;
            }
        }

        if (!found) {
            printf("%c = %c %c %c\n",
                   n[i].result, n[i].left, n[i].op, n[i].right);
        }
    }

    return 0;
}