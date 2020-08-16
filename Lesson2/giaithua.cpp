#include <stdio.h>

int n;
const int MAX_N = 29;

long long tinhGiaiThua(int n){
    long long ans = 1;
    for(int i  = 2; i <= n; i++){
        ans *= i;
    }
    return ans;
}
int main(){
    do{
        printf("Nhap so tu 1 den %d: ", MAX_N);
        scanf("%d", &n);
    } while(n > MAX_N);
    printf("Ket qua: %d! = %lld", n, tinhGiaiThua(n));
}
