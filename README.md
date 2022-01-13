# CommonDivisorsFinder
From Microprocessors lab to combine all the basic operations of emu8086
Here, I used the common sense that the first two divisors are 1 and the number itself. From the third divisor, my logic was that there's no use looping through the whole range of a number when it comes from or even after the half of the original input/preset value. So I started looping after finding the half of the number and upto 1 (The task was to not include 1 in the common divisors).

For the second input, as soon as the user inserts, the program, after finding each of its divisors, matches with each of the divisors of the first stored in the array (declared in the data segment).

It is also important to note that the task specifically wanted the inputs to be two digits. So, additional looping is necessary for more. Also, The array length was set to 12 as the highest number of divisors for any two digit integer is 12.
