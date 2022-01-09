#ifndef KERNEL
#define KERNEL
#include <iostream>
#include <cuda.h>
#include <map>
#include <functional>
#include "defs.hpp"

__host__ void Collatz(ULL n) {
    while (n > 1) {
        n % 2 == 0 ? n /= 2 : n = n * 3 + 1;
    }
    std::cout << 1 << std::endl;
}

__host__ void VerboseCollatz(ULL n) {
    std::cout << n << std::endl;
    while (n > 1) {
        auto m = n % 2 == 0;
        n = m * (n / 2) + !m * (n * 3 + 1);
        std::cout << n << std::endl;
    }
}

__host__ bool VerifyCollatz(ULL n) {
    try {
        n /= (n&-n);
        while(n > 1) {
            n = 3*n+1;
            n /= (n&-n);
        }
        return true;
    } catch(...) {
        return false;
    }
}

__device__ void ParallelCollatz(ULL n) {
    
}

__host__ LL CollatzCount(ULL n) {
    ULL count = 1;
    while (n > 1) {
        auto m = n % 2 == 0;
        n = m * (n / 2) + !m * (n * 3 + 1);
        count++;
    }
    return count;
}

#endif