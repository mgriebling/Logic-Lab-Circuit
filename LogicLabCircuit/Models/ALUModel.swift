//
//  ALU.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import Foundation

struct ALUModel {
    static func compute(intA: Int, intB: Int = 0, operation: ALUOperation) -> Int {
        switch operation {
        case .add:
            intA &+ intB
        case .sub:
            intA &- intB
        case .notGate:
			not(intA)
        case .andGate:
            intA & intB
        case .nandGate:
			not(intA & intB)
        case .orGate:
            intA | intB
        case .norGate:
			not(intA | intB)
        case .xorGate:
            intA ^ intB
        case .xnorGate:
			not(intA ^ intB)
        }
    }
	
	static func not(_ input: Int) -> Int {
		(input != 0) ? 0 : 1
	}
}
