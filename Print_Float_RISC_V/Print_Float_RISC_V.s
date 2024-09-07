
# Print Float In RISC V
# Name :- Tarak Sonawane
# LinkedIn :- https://www.linkedin.com/in/taraksonawane/

.data
#Input 

#Enter number of elements in total_elements.
#Enter float array elements in array.
total_elements: .word 3
array: .float 1.2351,   4.1240, -9.9243


#Strings
new_line: .string "\n"
minus: .string "-"
done_by: .string "\nDone by Tarak Sonawane"
linkedin: .string "\nConnect With Me On LinkedIn: https://www.linkedin.com/in/taraksonawane/"
thank_you: .string "\nThank You\n"
dot: .string "."
space: .string "             "

#Utilities
pos_truncation: .float 0.5
last_4_digits: .space 16 # As we get last 4 digits in reverse order we store it and print it in reverse roder so that we get it in right order
multiplier: .float 100

.text
.globl _start

#Program Starts From Here :-
_start:

#Storing Float Array address in x20 before executing initialize_print.
la x20,array

#initialize printing float array. Header address for our float array is stored at x20
initialize_print:
la x13,total_elements
lw x13,0(x13) #x13 contains total numbers of elements to print.

li x18,0  #Counter 

li x19,1
slli x19,x19,2

print:
flw f0,0(x20) #f0 = Float Number

la x2,multiplier
flw f1,0(x2) #f1 = 100

fmul.s f2,f0,f1
fmul.s f2,f2,f1
fcvt.w.s x2, f2 #stroing non-fractional part

#check wether it is -ve or +ve
beq x2,zero,zero_value_detecteed
bgt x2,zero,number_detected

#If negative
    la a1, minus #Print -
    li a0, 4  
    ecall

    addi x3,zero, -1 # Load the divisor (10) into t3
    fcvt.s.w f11,x3
    fmul.s f0,f0,f11 #We have printed '-' for negative number 
                     #so now we will treat this number as positive number to print further.
                     #Hence we multiplied -ve number with -1 to get the +ve number.

blt x2,zero,number_detected

number_detected:
    la x6,pos_truncation #Truncation Value
    flw f6,0(x6)
    la x2,multiplier
    fcvt.w.s x4, f0           #stroing non-fractional part
    addi x3,zero, 10          # Load the divisor (10) into t3
    addi x5,zero, 0           # Counter For thee loop
    flw f1,0(x2)

    #Getting length of non-fractional part
    count_digits:
    beqz x4, result_pos_count  # If t1 is 0, exit the loop
    divu x4, x4, x3    # Divide t1 by 10
    addi x5, x5, 1     # Increment the length counter (t2)
    j count_digits     # Repeat the loop

    #We got the digit count till here.
    result_pos_count:
    addi x5,x5,0
    beqz x5,result_count_zero
    
    fmul.s f10,f0,f1
    fmul.s f10,f10,f1
    #Now e.g f1 = 21.1234, f10 = 211234.0

    #Using Truncation (-0.5) to avoid rounding up.
    fsub.s f10,f10,f6
    fcvt.w.s x9, f10 #Loading float as an int

    li x30, 10000         
    rem x9, x9, x30       #Get's last 4 digits

    fmv.s f10,f0 #stroing non-fractional  in f10
    beq x9,zero,notruncation #Don't do truncation if it's zero.

    #Else do truncation
    fsub.s f10,f0,f6


    notruncation:
    fcvt.w.s x2, f10 #stroing non-fractional part in int register x2
    addi a0,x0,1  #print non-fractional part
    addi a1,x2,0
    ecall

    j operate_last_4_digits
    
    result_count_zero:
    
    addi a0,x0,1  #print zero
    addi a1,zero,0
    ecall
    j operate_last_4_digits
  
zero_value_detecteed:
    j result_count_zero
    
 #Printing last 4 digits (Fractional Part)
 operate_last_4_digits:
    print_from_dot:
    la a1, dot# Printning .
    li a0, 4  
    ecall

    fmul.s f2,f0,f1 #operate_last_4_digits
    fmul.s f2,f2,f1
    fsub.s f2,f2,f6

    fcvt.w.s x2, f2 #stroing fractional part
    
    li x15,0
    li x16,4    
    la x8, last_4_digits        # Load the address of the last_4_digits array
 

    li x7, 10
    addi x19,zero,1
    slli x19,x19,2

    loop_for_4_times: #Get 4 last digits in reversed order

    rem x12, x2, x7  
    
    sw x12, 0(x8)    #store 4 elements in reserve order at x8 [-1] index      
    add x8, x8, x19      
    
    div x2,x2,x7
    addi x15,x15,1
    bne x15,x16,loop_for_4_times
    
    #PRINT
    la x8, last_4_digits  # Load the address of the last_4_digits array
    li x15,0
    
    addi x22,zero,3
    slli x22,x22,2 #last element pointer
    add x8,x22,x8
    
    addi x22,zero,-1
    slli x26,x22,2 #shift index to left

    print_last_4_digits:
    
    lw x12,0(x8)
    
    addi a0,x0,1  #print fractional part
    addi a1,x12,0
    ecall
    
    add x8,x8,x26
    addi x15,x15,1
    bne x15,x16,print_last_4_digits
    
    add x20,x20,x19
    addi x18,x18,1
    
    la a1, space #Print space
    li a0, 4  
    ecall
    
    bne x18,x13,next_element #if x18==x13 means we have traversed all the elements else go to next_element's address.

    j exit #if x18==x13 then this line will execute and end the program

    next_element:
    bne x18,x14,print
    ret

 exit:
    la a1, new_line
    li a0, 4  
    ecall

    la a1, linkedin
    li a0, 4  
    ecall

    la a1, done_by
    li a0, 4  
    ecall

    la a1, thank_you
    li a0, 4  
    ecall

    la a1, new_line
    li a0, 4  
    ecall

    addi a0,x0,10
    ecall
