#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main() {
    char s[20];
    scanf("%s", s);
    char temp = 't';
    for(int i = 0; s[i]; i++) {
        if(s[i] == '*' || s[i] == '/') {
            printf("%c = %c %c %c\n", temp, s[i-1], s[i], s[i+1]);
            s[i - 1] = temp;
            temp++;
            int j;
            for(j = i; s[j+2] != '\0'; j++) {
                s[j] = s[j + 2];
            }
            s[j] = '\0';
            i = -1;
        }
    }
    for(int i = 0; s[i]; i++) {
        if(s[i] == '+' || s[i] == '-') {
            printf("%c = %c %c %c\n", temp, s[i-1], s[i], s[i+1]);
            s[i - 1] = temp;
            temp++;
            int j;
            for(j = i; s[j+2] != '\0'; j++) {
                s[j] = s[j + 2];
            }
            s[j] = '\0';
            i = -1;
        }
    }
    return 0;
}