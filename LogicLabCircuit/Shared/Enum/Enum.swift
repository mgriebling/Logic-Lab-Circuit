//
//  Enum.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//
import Foundation

enum ALUOperation: String, CaseIterable {
    case add = "ADD"
    case sub = "SUB"
	case notGate = "NOT"
    case andGate = "AND"
	case nandGate = "NAND"
    case orGate = "OR"
	case norGate = "NOR"
    case xorGate = "XOR"
	case xnorGate = "XNOR"
	
	static func getOperations(for kind: OperationKind) -> [Self] {
		switch kind {
			case .math: [.add, .sub]
			case .basic: [.andGate, .orGate, .xorGate]
			case .inverted: [.notGate, .nandGate, .norGate, .xnorGate]
		}
	}
	
}

enum OperationKind: String, CaseIterable {
	case math = "MATH"
	case basic = "BASIC"
	case inverted = "INVERTED"
}
