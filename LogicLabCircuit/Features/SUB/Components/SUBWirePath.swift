//
//  SUBWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct SUBWirePath: View {
    let store: StoreOf<SUBFeature>

	var body: some View {
		let xorAB = store.inputA != store.inputB
		let xnorAB = !(store.inputA != store.inputB)
		let notA = !store.inputA
		let andAB = store.inputB && notA
		
		ZStack {
			// Bin to XOR2
			Line.hline(from: CGPoint(18, 57.5), length: 257, active: store.inputBi)
			
			// Dot at Bin to AND2 & Bin to XOR2
			Line.vhlines(from: CGPoint(125, 57.5), offsets: [122.5, 90], active: store.inputBi, dot: true)
			
			// XOR2 to D
			Line.hline(from: CGPoint(295, 70), length: 60, active: store.outputD)
			
			// A to XOR1
			Line.hline(from: CGPoint(18, 97.5), length: 45, active: store.inputA)
			
			// B to XOR1
			Line.hline(from: CGPoint(18, 127.5), length: 47, active: store.inputB)
			
			// Dot at A to NOT1
			Line.vhlines(from: CGPoint(30, 97.5), offsets: [125, 35], active: store.inputA, dot: true)
			
			// NOT1 to AND1
			Line.hline(from: CGPoint(92.5, 222.5), length: 17.5, active: notA)
			
			// B to AND1
			Line.vhlines(from: CGPoint(50, 127.5), offsets: [117.5, 60], active: store.inputB, dot: true)
			
			// XOR1 to NOT2
			Line.hvlines(from: CGPoint(102.5, 115), offsets: [37.5, 45, 25], active: xorAB)
			
			// Dot at XOR1 to XOR2
			Line.hvlines(from: CGPoint(140, 115), offsets: [105, -30, 30], active: xorAB, dot: true)
			
			// NOT2 to AND2
			Line.hline(from: CGPoint(175, 160), length: 40, active: xnorAB)
			
			// AND2 to OR
			Line.hline(from: CGPoint(250, 167.5), length: 30, active: xnorAB)
			
			// AND1 to OR
			Line.hvlines(from: CGPoint(150, 230), offsets: [110, -40, 20], active: andAB)
			
			// OR to Bo
			Line.hline(from: CGPoint(317.5, 177.5), length: 37.5, active: store.outputBo)
		}
	}
}
