//
//  ADDWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ADDWirePath: View {
	let store: StoreOf<ADDFeature>
	
	var body: some View {
		let inA = store.inputA
		let inB = store.inputB
		let inCi = store.inputCi
		let outCo = store.outputCo
		let andAB = inA && inB
		let xorAB = inA != inB
		
		ZStack {
			// A to XOR1
			Line.hline(from: CGPoint(18, 25), length: 47, active: inA)
			
			// B to XOR1
			Line.hline(from: CGPoint(18, 65), length: 47, active: inB)
			
			// XOR1 output to XOR2
			Line.hvlines(from: CGPoint(118, 45), offsets: [32, 20, 42], active: xorAB)
			
			// Cin to XOR2
			Line.hvlines(from: CGPoint(18, 105), offsets: [62, -10, 113], active: inCi)
			
			// XOR2 output to SUM
			Line.hline(from: CGPoint(228, 80), length: 115, active: store.outputS)
			
			// dot at A to AND1
			Line.vhlines(from: CGPoint(50, 25), offsets: [215, 64], active: inA, dot: true)
			
			// dot at B to AND1
			Line.vhlines(from: CGPoint(30, 65), offsets: [205, 85], active: inB, dot: true)
			
			// Dot at Cin to XOR2 and AND2
			Line.vhlines(from: CGPoint(80, 105), offsets: [45, 35], active: inCi, dot: true)
			
			// Dot at XOR1 output to XOR2
			Line.vhlines(from: CGPoint(150, 65), offsets: [55, -55, 60, 15], active: xorAB, dot: true)
			
			// AND1 output to OR
			Line.hvlines(from: CGPoint(160, 165), offsets: [30, 15, 50], active: andAB)
			
			// AND2 output to OR
			Line.hvlines(from: CGPoint(160, 255), offsets: [30, -45, 50], active: outCo)
			
			// OR output to COUT
			Line.hline(from: CGPoint(278, 195), length: 65, active: outCo)
		}
	}
}
