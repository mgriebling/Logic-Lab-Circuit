//
//  NANDGateLayout.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct NANDGateLayout: View {
    let store: StoreOf<NANDFeature>

	var body: some View {
		HStack(alignment: .top, spacing: 40) {
			// Inputs
			VStack(spacing: 20) {
				LogicNode(label: "A", active: store.inputA)
				LogicNode(label: "B", active: store.inputB)
			}
			
			// Gate
			VStack {
				Image(store.output ? "NAND_On" : "NAND").resizable()
					.frame(width: 80, height: 60)
			}
			
			// Output
			VStack {
				LogicNode(label: "O", active: store.output, output: true)
			}
			.padding(.top, 20)
		}
	}
}
