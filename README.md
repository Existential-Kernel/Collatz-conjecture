<h1 align="center">Collatz conjecture</h1>
<br>

## Explaining the Collatz conjecture

> The Collatz conjecture in mathematics asks whether repeating certain simple arithmetic operations will eventually transform every positive integer into one. It concerns sequences of integers in which each term is obtained from the previous term as follows: if the previous term is even, the next term is one half of the previous term. If the previous term is odd, the next term is 3 times the previous term plus 1. The conjecture is that these sequences always reach 1, no matter which positive integer is chosen to start the sequence. - *From [Wikipedia](https://en.wikipedia.org/wiki/Collatz_conjecture#)*

- - -

To simplify, the following iterative sequence is defined for the set of positive integers:
```
n → n/2 (n is even)
n → 3n + 1 (n is odd)
```

Using the rule above and starting with 6, we generate the following sequence:

`6` => `3` => `10` => `5` => `16` => `8` => `4` => `2` => `1`

Since it goes down to `1`, the conjecture is true for `6`.

If you want to know more about the conjecture, I recommend you watch [this video](https://www.youtube.com/watch?v=094y1Z2wpJg)

- - -


<!--
Since I'm using a 64 bit processor, the maximum number my CPU can compute is `64` bits, or `18,446,744,073,709,551,615`. 
-->
