#ifndef KERNEL
#define KERNEL
#include <iostream>
#include <cuda.h>
#include <map>
#include <functional>
#include <bit>
#include <bitset>
#include <cstdint>
#include "defs.hpp"

__host__ void Collatz(ULL n) {
    std::cout << n << std::endl;
    while (n > 1) {
        n % 2 == 0 ? n /= 2 : n = n * 3 + 1;
    }
}

__host__ void VerboseCollatz(ULL n) {
    std::cout << n << std::endl;
    while (n > 1) {
        auto m = n % 2 == 0;
        n = m * (n / 2) + !m * (n * 3 + 1);
        std::cout << n << "\n";
    }
}

__host__ bool VerifyCollatz(ULL n) {
    try {
        n /= (n&-n);
        while(n > 1) {
            n = 3*n+1;
            n /= (n&-n);
        }
        /* For anybody reading this, the above expression is the equivalent to:
         *   if (n % 2 == 0) {  
         *     n = n / 2;
         *   } else {
         *     n = n * 3 + 1;
         *   }
        */
        return true;
    } catch(...) {
        return false;
    }
}

__device__ void ParallelCollatz(ULL n) {
    
}

__host__ ULL CollatzCount(ULL n) {
    ULL count = 1;
    while (n > 1) {
        auto m = n % 2 == 0;
        n = m * (n / 2) + !m * (n * 3 + 1);
        count++;
    }
    return count;
}

#endif