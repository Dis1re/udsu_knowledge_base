#include <stdio.h>

void printFullName() {
    printf("Full Name: John Doe\n");
}

void printYearOfBirth() {
    printf("Year of Birth: 2000\n");
}

void printAge() {
    printf("Age: 24\n");
}

void printGroup() {
    printf("Group: 101\n");
}

int main() {
    char key;
    printf("Enter key (F/B/A/G): ");
    scanf(" %c", &key);

    switch (key) {
    case 'F':
    case 'f':
        printFullName();
        break;
    case 'B':
    case 'b':
        printYearOfBirth();
        break;
    case 'A':
    case 'a':
        printAge();
        break;
    case 'G':
    case 'g':
        printGroup();
        break;
    default:
        printf("Invalid key\n");
    }

    return 0;
}