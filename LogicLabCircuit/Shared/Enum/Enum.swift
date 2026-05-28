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
    case andGate = "AND"
	case nandGate = "NAND"
    case orGate = "OR"
	case norGate = "NOR"
    case xorGate = "XOR"
	case xnorGate = "XNOR"
}
