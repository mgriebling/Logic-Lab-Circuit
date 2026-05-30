//
//  Formula.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 01/08/25.
//

import Foundation

struct FullAdderFormula {
    static let sum = "(A ⊕ B) ⊕ Ci"
    static let carryOut = "(A ⋅ B) + (Ci ⋅ (A ⊕ B))"
}

struct FullSubtractorFormula {
    static let difference = "(A ⊕ B) ⊕ Bi"
    static let borrow = "¬A ⋅ B + ¬A ⋅ Bi + B ⋅ Bi"
}

struct HalfAdderFormula {
    static let sum = "A ⊕ B"
    static let carryOut = "A ⋅ B" 
}

struct HalfSubtractorFormula {
    static let difference = "A ⊕ B"
    static let borrow = "¬A ⋅ B"
}

struct ANDFormula {
    static let conjunction = "A ⋅ B"
}

struct NOTFormula {
	static let negation = "¬A"
}

struct NANDFormula {
	static let nand = "¬(A ⋅ B)"
}

struct ORFormula {
    static let disjunction = "A + B"
}

struct NORFormula {
	static let nor = "¬(A + B)"
}

struct XORFormula {
    static let exclusiveOr = "A ⊕ B"
}

struct XNORFormula {
	static let exclusiveNor = "¬(A ⊕ B)"
}
