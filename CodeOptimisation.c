#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
struct Node{
    char op, l, r, res;
} dag[50];

int n = 0;

int found(char op, char l, char r) {
    for(int i=0; i<n; i++){
        if(dag[i].op == op && dag[i].l == l && dag[i].r == r) return i;
    }
    return -1;
}

int main(){
    int m;
    char res, equals, l, op, r;
    printf("Enter Number Of Expressions : ");
    scanf("%d", &m);
    printf("Enter expression\n");

    for(int i=0; i<m; i++){
        scanf(" %c = %c %c %c", &res, &l, &op, &r);
        int k = found(op, l, r);
        if(k == -1){
            dag[n].op = op;
            dag[n].l = l;
            dag[n].r = r;
            dag[n].res = res;
        } else {
            dag[n].op = ' ';
            dag[n].l = dag[k].res;
            dag[n].r = ' ';
            dag[n].res = res;
        }
        n++;
    }

    printf("\nCode Optimization: \n");
    for(int i=0; i<n; i++){
        printf("%c = %c %c %c\n", dag[i].res, dag[i].l, dag[i].op, dag[i].r);
    }

    printf("\nFurther Code Optimization: \n");
    for(int i=0; i<n; i++){
        if(dag[i].l >= '0' && dag[i].l <= '9' && dag[i].r >= '0' && dag[i].r <= '9'){
            int num1 = dag[i].l - '0';
            int num2 = dag[i].r - '0';
            if(dag[i].op == '+') num1 = num1 + num2;
            else if(dag[i].op == '-') num1 = num1 - num2;
            else if(dag[i].op == '*') num1 = num1 * num2;
            else if(dag[i].op == '/') num1 = num1 / num2;

            dag[i].op = ' ';
            dag[i].l = num1 + '0';
            dag[i].r = ' ';
        }
        printf("%c = %c %c %c\n", dag[i].res, dag[i].l, dag[i].op, dag[i].r);
    }

    return 0;
}