# IS1200-lab-4

## Questions for Assignment 1

### Explain how each of the ALU functions are defined. In particular, you need to be able to explain how subtraction works, including the use of two's complement.
#### Answer:
AND is using an and gate. Which selects the bits that are 1. 

OR is using an OR-gate that sends the result to the MUX.

Addition uses an adder that adds inputs A and B together, but only when the carry-in is set to 0.

Subtraction works similarly to addition except when the carry-in is 1, there is a mux that inverts the values in the B input. Which using two’s complement is given as a negative value. Meaning if the MSB is a 1, the value is handled as a negative number.   

SLT (set less than) first subtracts B from A and shifts the result so the only bit left (most significant bit) is moved to be the least significant bit.


### How did you implement the logic for the Zero output port? Did you consider any alternatives? Be prepared to explain your design choices.
#### Answer:
We first tried building the logic using AND-gates but landed in a single OR-gate with 32 inputs followed by a NOT-gate.

### What is the purpose of the ALU? Why are several functions grouped together into one component?
#### Answer:
To save money on hardware, it's very convenient. One of the basic foundations of a processor. 

---

## Questions for Assignment 2

### Explain if the read operation or the write operation, or both operations are clocked (updated at the clock edge). Why is it implement this way?
## Answer:
Read is not clocked, it can always be read. Meanwhile, the write operation only occurs on the rising edge to prevent unwanted loops. Exmaple: addi $t0, $t0, 1 >> $t0 = RAPID INCREASE

### Explain the semantics of reading from and writing to $0, and how you implemented this behavior.
## Answer
We didn’t add support for writing to $0 since it’s not meant to be written to. Instead, we just put a sign extended zero where its register would have been.

### How many bits of data can this register file store? If the address width was the same size as for a complete 32-bits MIPS processor, how many bits would in such a case such register file store?
## Answer:
This register file can store 7*32 bits( plus 32 bits for the zero register).

---

## Questions for Assignment 3

### Explain how you have implemented the control signals for the beq instruction. Why is this a correct solution?
## Answer:
We used the same method as for the other I-instruction (addi at the top) and check the OP code. This solution is correct cause it allows us to add more instructions easily.

### Be prepared to explain why the RegDst control signal or the AluSrc signal is hooked up to certain signals. You should be prepared to explain this using the following figure.
## Answer:
RegDst determines the target address in the register for the data to be written. And the ALUSrc is used for determining the second source of data for the ALU. For instance, add would take two values from the register, while addi would take one from the register and one form the instruction.

---

## Questions for Assignment 4

### Explain how the bit selection works for the alternatives that are controlled by the RegDst control signal. Which instructions are using what logic and why?
## Answer:
Addi uses RegDst:0 because there are only two registers that are handled. Add uses RegDst:1 because there are three registers that are handled. Beq:? It doesn’t matter because we don’t write to the register file. 

### Explain how the beq instruction is implement, how the address is calculated, and how the signals are controlled by the control unit.
## Answer:
To find the correct address, we select the first 8 bits (from the right) that we sign and extend to become 32 bits. After this, we shift 2 to the left and select the first 8 bits again (not optimized). This is followed by adding it together with the current PC + 4.
This new address is set as the next step if the Branch and Zero flags are 1.

---

## Questions for Assignment 5

### Show and explain how the factorial function works for arbitrary input value n (the teaching assistant will give you the value that you should test). Be prepared so that you know how to change the input value easily.
## Answer:
See comments in the code file.

### Explain how you implemented unconditional jumps in your program.
## Answer:
See comments in the code file.
