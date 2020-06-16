.data
argument1: .word 512
argument2: .word 480
str1: .string "GCD value of "
str2: .string " and "
str3: .string " is "

.text
main:
        lw      a0, argument1   # load the argument1 'a'
        lw      a1, argument2   # load the argument2 'b'
        jal     ra, GCD         # run GCD(a,b)

        mv      a2, a0          # save the result of GCD(a,b) into a2
        lw      a0, argument1   # load the argument 'a' into a0
        lw      a1, argument2   # load the argument 'b' into a1
        jal     ra, printResult # print out the result

        li      a0, 10          # leave the program
        ecall

# the main part of GCD function
GCD:
        addi    sp, sp, -8      # allocate the stack
        sw      ra, 0(sp)       # save the recent return address into stack
        blt     a0, a1, swap    # if a < b, then jump into function 'swap'
        bne     a1, zero, gcd1  # if b != 0, then jump into function 'gcd1'
        lw      ra, 0(sp)       # load the last return address
        addi    sp, sp, 8       # reset the stack pointer
        ret

# the branch of GCD function
swap:
        add     a2, a1, zero
        mv      a1, a0
        add     a0, a2, zero
        call    GCD
        lw      ra, 0(sp)       # load the last return address
        addi    sp, sp, 8       # reset the stack pointer
        ret

# the branch of GCD function
gcd1:
        add     t0, a1, zero
        rem     a1, a0, a1      # calculate 'a%b'
        add     a0, t0, zero    
        call    GCD             # run GCD(b, a%b)
        
        lw      ra, 0(sp)       # load the last return address
        addi    sp, sp, 8       # reset the stack pointer
        ret

# print out the result
printResult:
        mv      t0, a0
        mv      t1, a1
        mv      t2, a2

        la      a1, str1
        li      a0, 4
        ecall
        
        mv      a1, t0
        li      a0, 1
        ecall

        la      a1, str2
        li      a0, 4
        ecall

        mv      a1, t1
        li      a0, 1
        ecall

        la      a1, str3
        li      a0, 4
        ecall

        mv      a1, t2
        li      a0, 1
        ecall

        ret