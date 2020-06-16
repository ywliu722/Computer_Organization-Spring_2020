# 記憶體配置
# 0~79     array
# 80~87    recent saved address
# 88~95    previous saved address
# 96~103   previous return address

.data
argument: .word 10
str1: .string "Array: "
str2: .string "Sorted: "
str3: .string " "
str4: .string "\n"

.text
main:
        # allocate memeory
        addi    sp, sp, -104
        sw      ra, 96(sp)
        sw      s0, 88(sp)
        addi    s0, sp, 0
        sw      s0, 80(sp)

        # build up the array
        addi    a1, zero, 5
        sw      a1, 0(s0)
        addi    a1, zero, 3
        sw      a1, 8(s0)
        addi    a1, zero, 6
        sw      a1, 16(s0)
        addi    a1, zero, 7
        sw      a1, 24(s0)
        addi    a1, zero, 31
        sw      a1, 32(s0)
        addi    a1, zero, 23
        sw      a1, 40(s0)
        addi    a1, zero, 43
        sw      a1, 48(s0)
        addi    a1, zero, 12
        sw      a1, 56(s0)
        addi    a1, zero, 45
        sw      a1, 64(s0)
        addi    a1, zero, 1
        sw      a1, 72(s0)

        # print, sort, and print
        jal     ra, print1
        jal     ra, bubble

bubble:
        lw      s0, 80(sp)          # load the head of array
        addi    a0, zero, 1         # initialize i = 1
        addi    a1, zero, 0         # initialize j = 0
        call    loop_i              # jump into loop_i

loop_i:
        addi    a1, a0, -1          # calculate j = i - 1
        lw      s0, 80(sp)          # load the head of array
        addi    t1, zero, 8         # load 8 into t1
        mul     t0, a1, t1          # calculate how many step the pointer should go
        add     s0, s0, t0          # pointer shifting
        jal     ra, loop_j          # jump into loop_j

loop_j:
        lw      a2, 0(s0)           # load array[j] into t0
        lw      a3, 8(s0)           # load array[j+1] into t1
        blt     a3, a2, swap        # if(a2 > a3), then go to swap ra

        addi    s0, s0, -8          # array[j--]
        addi    a1, a1, -1          # j--
        bge     a1, zero, loop_j    # if(a1 >= 0), then go to loop_j
        
        addi    a0, a0, 1           # i++
        lw      t0, argument        # argumernt = 10
        blt     a0, t0, loop_i      # if(a0 < 10), then go to loop_i
        jal     ra, print2          # jump into print2

swap:
        add     t0, a2, zero        # t0 = array[j]
        add     a2, a3, zero        # array[j] = array[j+1]
        add     a3, t0, zero        # array[j+1] = t0
        sw      a2, 0(s0)           # save array[j] back to memory
        sw      a3, 8(s0)           # save array[j+1] back to memory
        ret                         # return to loop_j

print1:
        # print out "Array:"
        la      a1, str1
        li      a0, 4
        ecall

        # print '\n'
        la      a1, str4
        li      a0, 4
        ecall

        addi    a2, zero, 0         # initialize i = 0
        lw      s0, 80(sp)          # load the head of array
        j       printArray          # jump into printArray

print2:
        # print out "Sorted:"
        la      a1, str2
        li      a0, 4
        ecall

        # print '\n'
        la      a1, str4
        li      a0, 4
        ecall

        addi    a2, zero, 0         # initialize i = 0
        lw      s0, 80(sp)          # load the head of array
        jal     ra, printArray      # jump into printArray
        
        # deallocate the memory
        lw      s0, 88(sp)
        lw      ra, 96(sp)
        addi    sp, sp, 120

        # exit the program
        li      a0, 10
        ecall

printArray:
        # print the number in array
        lw      t0, 0(s0)
        mv      a1, t0
        li      a0, 1
        ecall

        # print blank space
        la      a1, str3
        li      a0, 4
        ecall

        addi    s0, s0, 8           # array[i++]
        addi    a2, a2, 1           # i++
        lw      t0, argument        # argumernt = 10
        blt     a2, t0, printArray  # if(a2 < 10, then go to printArray)
        
        # print '\n'
        la      a1, str4
        li      a0, 4
        ecall
        ret                         # return to main