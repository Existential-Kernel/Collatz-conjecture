#ifndef DEFS
#define DEFS

#include <string>

#define VERSION_MAJOR 1
#define VERSION_MINOR 0
#define VERSION "1.0"

typedef unsigned long long ULL;

const std::string ANSIRED = "\x1B[38;2;255;0;0m";
const std::string ANSIGREEN = "\x1B[38;2;0;255;0m";
const std::string ANSITERM = "\x1B[0m";

ULL n;
ULL ULL_max = std::numeric_limits<ULL>::max();

std::string s;

__host__ void PrintErr(char *errcode) {
    std::cout << ANSIRED << errcode << ANSITERM << std::endl;
    exit(-1);
}

#endif