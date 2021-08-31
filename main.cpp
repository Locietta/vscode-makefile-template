#include "foo.h"
#include "bar.h"
#include <cstdio>

int main() {
    int a, b;
    scanf("%d %d", &a, &b);
    foo(a);
    foo(b);
    printf("The gcd of %d and %d is %d\n", a, b, gcd(a, b)); // 输出最大公因数
}