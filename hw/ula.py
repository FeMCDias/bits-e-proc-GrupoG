#!/usr/bin/env python3

from myhdl import *
from .components import *
@block
def ula(x, y, c, zr, ng, saida, width=16):
    zx_out = Signal(modbv(0)[width:])
    nx_out = Signal(modbv(0)[width:])
    zy_out = Signal(modbv(0)[width:])
    ny_out = Signal(modbv(0)[width:])
    and_out = Signal(modbv(0)[width:])
    add_out = Signal(modbv(0)[width:])
    mux_out = Signal(modbv(0)[width:])
    no_out = Signal(modbv(0)[width:])

    c_zx = c(5)
    c_nx = c(4)
    c_zy = c(3)
    c_ny = c(2)
    c_f = c(1)
    c_no = c(0)

    z0 = zerador(c_zx, zx_out, x)
    i1 = inversor(c_nx, zx_out, nx_out)

    z2 = zerador(c_zy, zy_out, y)
    i2 = inversor(c_ny, zy_out, ny_out)
   
    m1 = mux2way(mux_out, and_out, add_out, c_f)
    i3 = inversor(c_no, mux_out, no_out)
   
    c1 = comparador(no_out, zr, ng, width)

    @always_comb
    def comb():
        if c_f: 
            mux_out.next = nx_out & ny_out
        else:
             mux_out.next = nx_out + ny_out

        saida.next = no_out
    return instances()


# -z faz complemento de dois
# ~z inverte bit a bit
@block
def inversor(z, a, y):
    @always_comb
    def comb():
        if z == 1:
            y.next = ~a
        else:
            y.next = a

    return instances()


@block
def comparador(a, zr, ng, width):
    # width insica o tamanho do vetor a
    @always_comb
    def comb():
        if a == 0:
            zr.next = 1
        else:
            zr.next = 0
        if a[width-1]:
            ng.next = 1
        else:
            ng.next = 0

    return instances()


@block
def zerador(z, a, y):
    @always_comb
    def comb():
        if z == 0:
            a.next = y
        else: a.next = 0
    return instances()


@block
def add(a, b, q):
    @always_comb
    def comb():
        q.next = a + b
    return instances()


@block
def inc(a, q):
    @always_comb
    def comb():
        q.next = a + 1

    return instances()


# ----------------------------------------------
# Conceito B
# ----------------------------------------------


@block
def halfAdder(a, b, soma, carry):
    s = Signal(bool())
    c = Signal(bool())

    @always_comb
    def comb():
        s = a ^ b
        c = a & b

        soma.next = s
        carry.next = c

    return instances()


@block
def fullAdder(a, b, c, soma, carry):
    s = [Signal(bool(0)) for i in range(3)]
    haList = [None for i in range(2)]

    haList[0] = halfAdder(a, b, s[0], s[1])  # 2
    haList[1] = halfAdder(c, s[0], soma, s[2])  # 3

    @always_comb
    def comb():
        carry.next = s[1] | s[2]  # 4

    return instances()



@block
def addcla4(a, b, q):

    new_a = [a(i) for i in range(4)]
    new_b = [b(i) for i in range(4)]

    z = 0

    @always_comb
    def comb():
        c =[z for i in range(4+1)]
        
        for i in range(4):
            c[i+1] = (new_a[i] & new_b[i]) | (new_a[i] ^ new_b[i]) & c[i]
            q.next[i] = new_a[i] ^ new_b[i] ^ c[i]

    return instances()


@block
def addcla16(a, b, q):
    new_a = [a(i) for i in range(16)]
    new_b = [b(i) for i in range(16)]

    z = 0

    @always_comb
    def comb():
        c =[z for i in range(16+1)]
        
        for i in range(16):
            c[i+1] = (new_a[i] & new_b[i]) | ((new_a[i] ^ new_b[i]) & c[i])
            
        if c[16] == 0:
            for i in range(16):
                q.next[i] = (new_a[i] ^ new_b[i]) ^ c[i]
        else:
            q.next = 0

    return instances()


# ----------------------------------------------
# Conceito A
# ----------------------------------------------

@block
def ula_new(x, y, c, zr, ng, sr, sf, bcd, saida, width=16):
    pass

    
@block
def bcdAdder(x, y, z):

    a = tuple([i for i in range(10) for j in range(1)]*10)
    b = tuple([i for i in range(10) for j in range(10)])

    @always_comb
    def comb():
        sum_ = x + y
        z.next = 0 if sum_ > 99 else concat(intbv(b[int(sum_)])[4:], intbv(a[int(sum_)])[4:])
    
    return instances()



