---
title: 用c语言实现斐波那契数列
tags: ["c"]
date: 2025-07-08T18:57:42.60+0800
---



```
#include <stdio.h>

int main(int argc, char* argv[])
{
    unsigned int a = 0, b = 1, c = 0;
    unsigned int i;

    for(i = 2; i <= 1000; i++)
    {
        c = b + a;      //前两个数的和为第三个数
        a = b;          //更新 a 为上一个数
        b = c;          //更新 b 为当前数
    }

    printf("斐波那契数列第1000个数为：%u\n", c);

    return 0;
}
```
