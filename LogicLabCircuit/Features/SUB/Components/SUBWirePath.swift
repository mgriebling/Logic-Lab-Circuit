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
			Line.hline(from: CGPoint(x: 18, y: 57.5), length: 257, active: store.inputBi)
			
			// Dot at Bin to AND2
			Line.dot(at: CGPoint(x: 125, y: 57.5), active: store.inputBi)
			
			// Bin to XOR2
			Line.vline(from: CGPoint(x: 125, y: 57.5), length: 122.5, active: store.inputBi)
			Line.hline(from: CGPoint(x: 125, y: 180), length: 90, active: store.inputBi)
			
			// XOR2 to D
			Line.hline(from: CGPoint(x: 295, y: 70), length: 60, active: store.outputD)
			
			// A to XOR1
			Line.hline(from: CGPoint(x: 18, y: 97.5), length: 45, active: store.inputA)
			
			// B to XOR1
			Line.hline(from: CGPoint(x: 18, y: 127.5), length: 47, active: store.inputB)
			
			// A to NOT1
			Line.vline(from: CGPoint(x: 30, y: 97.5), length: 125, active: store.inputA)
			Line.hline(from: CGPoint(x: 30, y: 222.5), length: 35, active: store.inputA)
			
			// Dot at A to NOT1
			Line.dot(at: CGPoint(x: 30, y: 97.5), active: store.inputA)
			
			// NOT1 to AND1
			Line.hline(from: CGPoint(x: 92.5, y: 222.5), length: 17.5, active: notA)
			
			// B to AND1
			Line.vline(from: CGPoint(x: 50, y: 127.5), length: 117.5, active: store.inputB)
			Line.hline(from: CGPoint(x: 50, y: 245), length: 60, active: store.inputB)
			
			// Dot at B to AND1
			Line.dot(at: CGPoint(x: 102.5, y: 115), active: store.inputB)
			
			// XOR1 to NOT2
			Line.hline(from: CGPoint(x: 102.5, y: 115), length: 37.5, active: xorAB)
			Line.vline(from: CGPoint(x: 140, y: 115), length: 45, active: xorAB)
			Line.hline(from: CGPoint(x: 140, y: 160), length: 25, active: xorAB)
			
			// Dot at XOR1 to XOR2
			Line.dot(at: CGPoint(x: 140, y: 115), active: xorAB)
			
			// XOR1 to XOR2
			Line.hline(from: CGPoint(x: 140, y: 115), length: 105, active: xorAB)
			Line.vline(from: CGPoint(x: 245, y: 115), length: -30, active: xorAB)
			Line.hline(from: CGPoint(x: 245, y: 85), length: 30, active: xorAB)
			
			// NOT2 to AND2
			Line.hline(from: CGPoint(x: 175, y: 160), length: 40, active: xnorAB)
			
			// AND2 to OR
			Line.hline(from: CGPoint(x: 250, y: 167.5), length: 30, active: xnorAB)
			
			// AND1 to OR
			Line.hline(from: CGPoint(x: 150, y: 230), length: 110, active: andAB)
			Line.vline(from: CGPoint(x: 260, y: 230), length: -40, active: andAB)
			Line.hline(from: CGPoint(x: 260, y: 190), length: 20, active: andAB)
			
			// OR to Bo
			Line.hline(from: CGPoint(x: 317.5, y: 177.5), length: 37.5, active: store.outputBo)
		}
	}
}
