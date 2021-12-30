#include <iostream>
#include <time.h>
#include <limits>
#include <string.h>
#include <cstdlib>
#include <stdlib.h>
#include "kernel.cu"
#include "CLI11.hpp"

const std::string ANSIRED = "\x1B[38;2;255;0;0m";
const std::string ANSITERM = "\x1B[0m";

typedef unsigned long long ULL;

ULL n;
std::string s;

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
    CLI::App app;
    // Add new options/flags here
    CLI11_PARSE(app, argc, argv);

    if (argc == 1) {
        std::cerr << ANSIRED + "You must provide at least one argument!" + ANSITERM << std::endl;
        exit(0);
    } else if (!IsNumber(argv[1])) {
        std::cerr << ANSIRED + "Please enter a valid number!" + ANSITERM << std::endl;
        exit(0);
    } else {
        s = argv[1];
        n = std::stoull(s, nullptr, 0);
        VerboseCollatz(n);
    }
    return 0;
}