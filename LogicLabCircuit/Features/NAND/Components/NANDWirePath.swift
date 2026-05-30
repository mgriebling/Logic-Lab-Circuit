//
//  NANDWirePath.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct NANDWirePath: View {
    let store: StoreOf<NANDFeature>
	
	var body: some View {
		ZStack {
			// Input A to gate
			Line.hline(from: CGPoint(100, 55), length: 50, active: store.inputA)

			// Input B to gate
			Line.hline(from: CGPoint(100, 95), length: 50, active: store.inputB)

			// gate output to O
			Line.hline(from: CGPoint(200, 75), length: 80, active: store.output)
		}
	}
}
