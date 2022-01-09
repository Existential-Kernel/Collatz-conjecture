#ifndef KERNEL
#define KERNEL
#include <iostream>
#include <cuda.h>
#include <map>
#include <functional>
#include "defs.cuh"

__host__ void Collatz(ULL n) {
    while (n > 1) {
        n % 2 == 0 ? n /= 2 : n = n * 3 + 1;
    }
    std::cout << 1 << std::endl;
}

__host__ void VerboseCollatz(ULL n) {
    while (n > 1) {
        n % 2 == 0 ? n /= 2 : n = n * 3 + 1;
        std::cout << n << std::endl;
    }
}

__host__ void VerifyCollatz(ULL n) {

}
__host__ void Catch(){
    try {

    } catch (const std::overflow_error& err) {
        std::cerr << "The program has experienced an overflow error!\n" << std::endl;
    } catch (const std::runtime_error& err) {
        std::cerr << "The program has experienced an underflow error!\n" << std::endl;
    } catch (const std::exception& err) {
        std::cerr << "The program has experienced an exeption error!\n" << std::endl;
    } catch (...) {
        std::cerr << "The program has experienced an unexpected error!\n" << std::endl;
    }
}

__device__ void ParallelCollatz(ULL n) {
    
}

__host__ ULL CollatzCount(ULL n) {
    ULL count = 1;
    while (n > 1) {
        n % 2 == 0 ? n /= 2 : n = n * 3 + 1;
        count++;
    }
    return count;
}

std::map<std::string, std::function<void(unsigned long long)>> funcMap = {
    { "Collatz", Collatz},
    { "VerboseCollatz", VerboseCollatz},
    { "VerifyCollatz", VerifyCollatz},
    { "CollatzCount", CollatzCount},
    { "ParallelCollatz", ParallelCollatz}
};

#endif