# 記憶體配置:
# 一開始先Allocate 32 byte的空間, Stack的指標為0, 並將Array的指標設在16的地方
# 所以分配的空間由下到上為 (0為stack的basis)
# 0~7   former saved register address,
# 8~15  former return address
# 16~23 first value saved in array (result of Fibonacci(n-1))
# 24~31 second value saved in array (recent 'n')

.data
argument: .word 10
str1: .string "th number in the Fibonacci sequence is "

.text
main:
        lw      a0, argument    # load the argument 'n'
        jal     ra, Fibonacci   # run Fibonacci(n)

        mv      a1, a0          # save the result of Fibonacci(n) into a1
        lw      a0, argument    # load the argument 'n' into a0
        jal     ra, printResult # print out the result

        li      a0, 10          # leave the program
        ecall

# the main part of Fibonacci function
Fibonacci:
        addi    sp, sp, -32     # allocate the stack (會分配32byte是因為有4個值要存, sp由下往上存, s0由上往下存)
        sw      ra, 8(sp)       # save the recent return address into stack
        sw      s0, 0(sp)       # save the recent address of saved register into stack
        addi    s0, sp, 16      # set the pointer pointing to the top of the stack
        sw      a0, 8(s0)       # save recent 'n' into saved register
        bne     a0, zero, fib1  # if n != 0, then jump into function 'fib1'
        beq     a0, zero, re0   # if n == 0, then jump into function 're0'

# return 0
re0:
        addi    a0, zero, 0     # set the return value as 0
        lw      s0, 0(sp)       # load the last address of saved register
        lw      ra, 8(sp)       # load the last return address
        addi    sp, sp, 32      # reset the stack pointer
        ret

# the first branch of Fibonacci function
fib1:
        addi    a0, a0, -1
        bne     a0, zero, fib2  # if n != 1, then jump into function 'fib2'
        beq     a0, zero, re1   # if n == 1, then jump into function 're1'

# return 1
re1:
        addi    a0, zero, 1     # set the return value as 0
        lw      s0, 0(sp)       # load the last address of saved register
        lw      ra, 8(sp)       # load the last return address
        addi    sp, sp, 32      # reset the stack pointer
        ret

# the second branch of Fibonacci function
fib2:
        lw      a0, 8(s0)       # load the recent 'n' from saved register
        addi    a0, a0, -1      # calculate 'n-1'
        call    Fibonacci       # run Fibonacci(n-1)
        
        lw      a1, 8(s0)       # load the recent 'n' from saved register
        addi    a1, a1, -2      # calculate 'n-2'
        sw      a0, 0(s0)       # save the result of Fibonacci(n-1) into saved register
        add     a0, zero, a1    
        call    Fibonacci       # run Fibonacci(n-2)
        
        lw      a1, 0(s0)       # load the result of Fibonacci(n-1) from saved register
        add     a0, a0, a1      # the fibonacci sequece
        lw      s0, 0(sp)       # load the last address of saved register
        lw      ra, 8(sp)       # load the last return address
        addi    sp, sp, 32      # reset the stack pointer
        ret

# print out the result
printResult:
        mv      t0, a0
        mv      t1, a1

        mv      a1, t0
        li      a0, 1
        ecall

        la      a1, str1
        li      a0, 4
        ecall

        mv      a1, t1
        li      a0, 1
        ecall

        ret
