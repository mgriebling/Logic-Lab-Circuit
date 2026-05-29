//
//  ALU.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import Foundation

struct ALUModel {
	
	// Handle 1- and 2-argument terms
	static func compute(aIn: Bool, bIn: Bool = false, operation: ALUOperation) -> Bool {
		let (result, _) = compute(aIn: aIn, bIn: bIn, cIn: false, operation: operation)
		return result
	}
	
	static func compute(aIn: Bool, bIn: Bool = false, operation: ALUOperation) -> [Bool] {
		let (result, _) = compute(aIn: aIn, bIn: bIn, cIn: false, operation: operation)
		return [result]
	}
	
	// Handle 3-argument terms
	static func compute(aIn: Bool, bIn: Bool, cIn: Bool, operation: ALUOperation) -> [Bool] {
		let (result, extra) = compute(aIn: aIn, bIn: bIn, cIn: cIn, operation: operation)
		return [result, extra]
	}
	
	static func compute(aIn: Bool, bIn: Bool, cIn: Bool, operation: ALUOperation) -> (Bool, Bool) {
		var result: (x: Bool, y: Bool) = (false, false)
		
		switch operation {
		case .add:
			let xorAB = aIn != bIn
			result.x = xorAB != cIn					   // add out
			result.y = (aIn && bIn) || (cIn && xorAB)  // carry out
		case .sub:
			let notA = !aIn
			let notAANDB = notA && bIn
			let notAANDBi = notA && cIn
			let bANDBi = bIn && cIn
			let xorAB = aIn != bIn
			result.x = xorAB != cIn					    // subtract out
			result.y = notAANDB || notAANDBi || bANDBi  // borrow out
		case .notGate:
			result.x = !aIn
		case .andGate:
			result.x = aIn && bIn
		case .nandGate:
			result.x = !(aIn && bIn)
		case .orGate:
			result.x = aIn || bIn
		case .norGate:
			result.x = !(aIn || bIn)
		case .xorGate:
			result.x = aIn != bIn
		case .xnorGate:
			result.x = aIn == bIn
		}
		return result
	}
}
