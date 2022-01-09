#include <iostream>
#include <time.h>
#include <limits>
#include <string.h>
#include <cstdlib>
#include <stdlib.h>
#include <map>
#include <functional>
#include <algorithm>
#include <iterator>
#include "kernel.cu"
#include "defs.cuh"

__host__ static void PrintResult(bool result, ULL n) {
    std::cout << "\n=================================\n" << std::endl;
    switch(result) {
        case true:
            std::cout << ANSIGREEN << "The conjecture is \e[1mTRUE\e[0m"
                      << ANSIGREEN << " for " << n << "!" << ANSITERM << std::endl;
            break;
        case false:
            std::cout << ANSIRED << "\tThe conjecture is \e[1mFALSE\e[0m"
                      << ANSIRED << " for " << n << "!" << ANSITERM << std::endl;
            break;
        default:
            std::cerr << "Unknown error!" << std::endl;
            exit(-1);
    }
    std::cout << "\n=================================\n" << std::endl;

}

__host__ static bool IsOverflow(ULL n) {
    if (n > (ULL_max - 1)) {
        return true;
    } else { 
        return false; 
    }
}

__host__ static bool IsNumber(char *str) {
    if (str == NULL) {
        return 0;
    }

    int i = 0;
    int len = strlen(str);

    if (len == 1) {
        return isdigit(str[0]);
    }

    if (str[0] == '-' || str[0] == '+') {
        i = 1;
    }

    for (; i < len; i++) {
        if (!isdigit(str[i])) {
            return false;
        }
    }
    return true;
}

__host__ int main(int argc, char *argv[]) {
    /*
    CLI::App app;
    // Add new options/flags here
    CLI11_PARSE(app, argc, argv);
    */

    if (argc == 1) {
        PrintErr("You must provide at least one argument!");
    } else if (IsOverflow(n)) {
        PrintErr("Please enter a number that's under 2^64!");
    } else if (!IsNumber(argv[1])) {
        PrintErr("Please enter a valid number!");
    } else {
        s = argv[1];
        n = std::stoull(s, nullptr, 0);
        try { 
            VerboseCollatz(n); 
        } catch (...) {
            // TODO: improve the detection of a false conjecture
            PrintResult(false, n);
        }
        PrintResult(true, n);
    }
    return 0;
}