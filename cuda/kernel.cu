#ifndef KERNEL
#define KERNEL

__host__ void Collatz(ULL n) {
    while (n > 1) {
        n % 2 == 0 ? n /= 2 : n = n * 3 + 1;
    }
    std::cout << 1 << std::endl;
}

__host__ void VerboseCollatz(ULL n) {
    while (n > 1) {
        std::cout << 1 << std::endl;
        n % 2 == 0 ? n /= 2 : n = n * 3 + 1;
    }
}

__host__ bool VerifyCollatz(ULL n) {
    do {
        n % 2 == 0 ? n /= 2 : n = n * 3 + 1;
    } while (n != 1)

    return
}

__device__ void ParallelCollatz() {
    
}

__host__ CollatzCount(ULL n) {
    ULL count = 1;
    while (n != 1) {
        n % 2 == 0 ? n /= 2 : n = n * 3 + 1;
        count++;
    }
    return count;
}

#endif