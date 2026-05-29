//
//  ALU.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import Foundation

struct ALUModel {
	
	// Handle 1- and 2-argument terms
	static func compute(intA: Int, intB: Int = 0, operation: ALUOperation) -> Int {
		let (result, _) = compute(a: intA != 0, b: intB != 0, c: false, operation: operation)
		return result ? 1 : 0
	}
	
	// Handle 1- and 2-argument terms
	static func compute(aIn: Bool, bIn: Bool = false, operation: ALUOperation) -> Bool {
		let (result, _) = compute(a: aIn, b: bIn, c: false, operation: operation)
		return result
	}
	
	// Handle 3-argument terms
	static func compute(a: Bool, b: Bool, c: Bool, operation: ALUOperation) -> (Bool, Bool) {
		var result: (x: Bool, y: Bool) = (false, false)
		
		switch operation {
		case .add:
			let xorAB = a != b
			result.x = xorAB != c
			result.y = (a && b) || (c && xorAB)  // carry out
		case .sub:
			let notA = !a
			let notAANDB = notA && b
			let notAANDBi = notA && c
			let bANDBi = b && c
			let xorAB = a != b
			result.x = xorAB != c
			result.y = notAANDB || notAANDBi || bANDBi  // borrow out
		case .notGate:
			result.x = !a
		case .andGate:
			result.x = a && b
		case .nandGate:
			result.x = !(a && b)
		case .orGate:
			result.x = a || b
		case .norGate:
			result.x = !(a || b)
		case .xorGate:
			result.x = a != b
		case .xnorGate:
			result.x = a == b
		}
		return result
	}
}
