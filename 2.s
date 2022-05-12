addi x6, x0, 1 #x6 = 1

FIB:
V1:
bne x10, x0, V2
addi, x10, x0, 0 #se x10 = 0, retorna 0
jalr x0,0(x1)

V2:
bne x10, x6, L1
addi, x10, x0, 1 #se x10 = 1, retorna 1
jalr x0,0(x1)

L1:
#alocacao da pilha
addi sp, sp, -12
sw x1, 8(sp)
sw x10, 4(sp)

#chamada de fib(x10 - 1)
addi x10, x10, -1
jal, x1, FIB

#armazena retorna de fib(x10 - 1)
sw x10, 0(sp)

#coloca em x10 seu valor original
lw x10, 4(sp)

#chamada de fib(x10 - 2)
addi x10, x10, -2
jal, x1, FIB

#coloca em x5 o retorno de fib(x10 - 1)
lw x5, 0(sp)

#x10 = fib(x10 - 1) + fib(x10 - 2)
add x10, x10, x5

#recupera endereco de chamada
lw x1, 8(sp)

#desaloca pilha
addi sp, sp, 12

jalr x0,0(x1)