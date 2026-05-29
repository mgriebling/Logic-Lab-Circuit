//
//  NORWirePath.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct NORWirePath: View {
    let store: StoreOf<NORFeature>
	
	var body: some View {
		ZStack {
			// Input A to gate
			Line.hline(from: CGPoint(x: 95, y: 55), length: 65, active: store.inputA)

			// Input B to gate
			Line.hline(from: CGPoint(x: 95, y: 95), length: 65, active: store.inputB)

			// gate output to O
			Line.hline(from: CGPoint(x: 200, y: 75), length: 65, active: store.output)
		}
	}
}
