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
		let andAB = store.inputA && store.inputB
		let xorAB = store.inputA != store.inputB
		ZStack {
			// A to XOR1
			Line.hline(from: CGPoint(x: 18, y: 25), length: 47, active: store.inputA)
			
			// B to XOR1
			Line.hline(from: CGPoint(x: 18, y: 65), length: 47, active: store.inputB)
			
			// XOR1 output to XOR2
			Line.hline(from: CGPoint(x: 118, y: 45), length: 32, active: xorAB)
			Line.vline(from: CGPoint(x: 150, y: 45), length: 20, active: xorAB)
			Line.hline(from: CGPoint(x: 150, y: 65), length: 42, active: xorAB)
			
			// Dot at XOR1 output to XOR2
			Line.dot(at: CGPoint(x: 150, y: 65), active: xorAB)
			
			// Cin to XOR2
			Line.hline(from: CGPoint(x: 18, y: 105), length: 62, active: store.inputCi)
			Line.vline(from: CGPoint(x: 80, y: 105), length: -10, active: store.inputCi)
			Line.hline(from: CGPoint(x: 80, y: 95), length: 113, active: store.inputCi)
			
			// Dot at Cin to XOR2 and AND2
			Line.dot(at: CGPoint(x: 80, y: 105), active: store.inputCi)
			
			// XOR2 output to SUM
			Line.hline(from: CGPoint(x: 228, y: 80), length: 112, active: store.outputS)
			
			// dot at A to AND1
			Line.dot(at: CGPoint(x: 50, y: 25), active: store.inputA)
			Line.vline(from: CGPoint(x: 50, y: 25), length: 215, active: store.inputA)
			Line.hline(from: CGPoint(x: 50, y: 240), length: 65, active: store.inputA)
			
			// dot at B to AND1
			Line.dot(at: CGPoint(x: 30, y: 65), active: store.inputB)
			Line.vline(from: CGPoint(x: 30, y: 65), length: 205, active: store.inputB)
			Line.hline(from: CGPoint(x: 30, y: 270), length: 85, active: store.inputB)
			
			// Cin to AND2
			Line.vline(from: CGPoint(x: 80, y: 105), length: 45, active: store.inputCi)
			Line.hline(from: CGPoint(x: 80, y: 150), length: 35, active:store.inputCi)
			
			// XOR1 output to AND2
			Line.vline(from: CGPoint(x: 150, y: 65), length: 55, active: xorAB)
			Line.hline(from: CGPoint(x: 150, y: 120), length: -55, active: xorAB)
			Line.vline(from: CGPoint(x: 95, y: 120), length: 60, active: xorAB)
			Line.hline(from: CGPoint(x: 95, y: 180), length: 15, active: xorAB)
			
			// AND1 output to OR
			Line.hline(from: CGPoint(x: 160, y: 165), length: 30, active: andAB)
			Line.vline(from: CGPoint(x: 190, y: 165), length: 15, active: andAB)
			Line.hline(from: CGPoint(x: 190, y: 180), length: 50, active: andAB)
			
			// AND2 output to OR
			Line.hline(from: CGPoint(x: 160, y: 255), length: 30, active: store.outputCo)
			Line.vline(from: CGPoint(x: 190, y: 255), length: -45, active: store.outputCo)
			Line.hline(from: CGPoint(x: 190, y: 210), length: 50, active: store.outputCo)
			
			// OR output to COUT
			Line.hline(from: CGPoint(x: 278, y: 195), length: 62, active: store.outputCo)
		}
	}
}
