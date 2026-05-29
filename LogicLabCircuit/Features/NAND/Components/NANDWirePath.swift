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
			Line.hline(from: CGPoint(x: 100, y: 55), length: 50, active: store.inputA)

			// Input B to gate
			Line.hline(from: CGPoint(x: 100, y: 95), length: 50, active: store.inputB)

			// gate output to O
			Line.hline(from: CGPoint(x: 200, y: 75), length: 80, active: store.output)
		}
	}
}


