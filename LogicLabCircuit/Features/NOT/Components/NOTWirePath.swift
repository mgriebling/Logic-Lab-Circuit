//
//  NOTWirePath.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct NOTWirePath: View {
    let store: StoreOf<NOTFeature>
	
	var body: some View {
		ZStack {
			// Input A to gate
			Line.hline(from: CGPoint(95, 75), length: 65, active: store.inputA)

			// gate output to O
			Line.hline(from: CGPoint(200, 75), length: 65, active: store.output)
		}
	}
}
