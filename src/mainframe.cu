#include <iostream>
#include <limits>
#include <chrono>
#include <string.h>
#include <cstdlib>
#include <map>
#include <functional>
#include <algorithm>
#include <iterator>

#include <bit>
#include <bitset>
#include <cstdint>

#include "kernel.cu"
#include "defs.hpp"
#include "../lib/CLI11.hpp"

__host__ static void PrintResult(bool result, double time, ULL n, bool milli) {
    std::cout << "\n=================================\n" << std::endl;
    switch(result) {
        case true:
            std::cout << ANSIGREEN << "The conjecture is \e[1mTRUE\e[0m"
            << ANSIGREEN << " for " << "\e[1m" << n << "!" << "\e[0m"
            << ANSITERM << std::endl;
            break;
        case false:
            std::cout << ANSIRED << "\tThe conjecture is \e[1mFALSE\e[0m"
            << ANSIRED << " for " << "\e[1m" << n << "!" << "\e[0m" 
            << ANSITERM << std::endl;
            break;
        default:
            std::cerr << "Unknown error!" << std::endl;
            exit(-1);
    }

    if (milli == false) {
        std::cout << "Executed in " << time * 1000 * 1000 << " microseconds!" << std::endl;
    } else if (milli == true) {
        std::cout << "Executed in " << time * 1000 << " milliseconds!" << std::endl;
    } else {
        PrintErr("Unknown error!");
        exit(-1);
    }

    std::cout << "\n=================================\n" << std::endl;
}

__host__ static bool IsOverflow(ULL n) {
    if (n < (ULL_max - 1)) {
        return false;
    } else { 
        return true; 
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

    if (str[0] == '-') {
        PrintErr("Please choose a positive number!");
        return false;
    }

    for (; i < len; i++) {
        if (!isdigit(str[i])) {
            return false;
        }
    }
    return true;
}

__host__ int main(int argc, char *argv[]) {
    std::cout.sync_with_stdio(false);

    /*
    CLI::App app;
    bool my_flag{false};
    app.add_flag("--NoOutput", my_flag, "This will disable the verbose option when outputting the sequence");
    ULL ull_flag{};
    app.add_flag("--verify", ull_flag, "This will disable the verbose option when outputting the sequence");
    CLI11_PARSE(app, argc, argv);
    */

    if (argc == 1) {
        PrintErr("You must provide at least one argument!");
    } else if (!IsNumber(argv[1])) {
        PrintErr("Please enter a valid number!");
    } else if (IsOverflow(n)) {
        PrintErr("Please enter a number that's under 2^64!");
    } else {
        s = argv[1];
        n = std::stoull(s, nullptr, 0);
        try {
            // TODO: fix the CLI arguments and parameters
            auto start = std::chrono::high_resolution_clock::now();

            std::cout << VerifyCollatz(n) << std::endl;
            // VerboseCollatz(n);

            auto finish = std::chrono::high_resolution_clock::now();
            elapsed = finish - start;
            PrintResult(true, elapsed.count(), n, true);
        }  catch (const std::overflow_error& err) {
            PrintErr("The program has experienced an overflow error!\n");
        } catch (const std::runtime_error& err) {
            PrintErr("The program has experienced an underflow error!\n");
        } catch (const std::exception& err) {
            PrintErr("The program has experienced an exeption error!\n");
        } catch (...) {
            // TODO: improve the detection of a false conjecture
            PrintResult(false, elapsed.count(), n, true);
        }
    }
    return 0;
}