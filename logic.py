from sympy import symbols, Not, And, Or, Symbol, simplify

# Define symbols
RESET, SYNC_RESET, OSC_STABLE = symbols('RESET SYNC_RESET OSC_STABLE')
SeqControl_1, d101, d100 = symbols('SeqControl_1 d101 d100')
IR_4 = symbols('IR_4')

def dff(d):
    return d

def latch(d, enable):
    return And(d, enable)

# SYNC_RESET = 1
# RESET = 1
# OSC_STABLE = 0
# SeqControl_1 = 0
# d100 = 0
# d101 = 0
# IR_4 = 0

# Given expressions
w108 = RESET
w132 = d101
w133 = Not(And(IR_4, w132))
w134 = Not(w133)
w109 = dff(w134)
w107 = d100
w120 = dff(w107)
w121 = Not(Or(w120, w109, w108))
w122 = Not(w121)
w112 = SeqControl_1
w113 = dff(w112)
w118 = OSC_STABLE
w16 = SYNC_RESET
w15 = Not(w16)
w119 = Not(And(w15, w118))
w117 = dff(w119)
w115 = dff(w117)
w116 = Not(w115)
w114 = Not(Or(w116, w117))
w108 = RESET
w16 = SYNC_RESET
w14 = Not(Or(w16, w108))
w27 = Not(And(Or(w14, w114), w113))
w28 = latch(d=w27, enable=w122)
w66 = Not(w28)
CLK_ENA = w66

# Print the converted expressions
print("w108 =", w108)
print("w132 =", w132)
print("w133 =", w133)
print("w134 =", w134)
print("w109 =", w109)
print("w107 =", w107)
print("w120 =", w120)
print("w121 =", w121)
print("w122 =", w122)
print("w112 =", w112)
print("w113 =", w113)
print("w118 =", w118)
print("w16 =", w16)
print("w15 =", w15)
print("w119 =", w119)
print("w117 =", w117)
print("w115 =", w115)
print("w116 =", w116)
print("w114 =", w114)
print("w14 =", w14)
print("w27 =", w27)
print("w28 =", w28)
print("w66 =", w66)
print("CLK_ENA =", CLK_ENA)
print()

from sympy.logic import SOPform
from sympy.logic.boolalg import truth_table

from sympy.logic.boolalg import to_cnf, to_dnf

print("CLK_ENA =", to_cnf(CLK_ENA, simplify=True))
print("CLK_ENA =", to_dnf(CLK_ENA, simplify=True))
print()

table = truth_table(CLK_ENA, [RESET, SYNC_RESET])
for t in table:
    print(t[0], ':', to_cnf(t[1], simplify=True))
