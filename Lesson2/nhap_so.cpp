#include <stdio.h>
#include <string.h>

bool checkSoNguyenDuong(char s[]){
    for(int i = 0; i < strlen(s); i++){
        if(s[i] < '0' || s[i] > '9'){
            return false;
        }
    }
    return true;
}

int main(){
    char s[50];
    do{
        scanf("%s", &s);
    } while(!checkSoNguyenDuong(s));
    printf("\nBan da nhap so nguyen duong!");

}
