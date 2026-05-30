//
//  NOTGateLayout.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct NOTGateLayout: View {
    let store: StoreOf<NOTFeature>

	var body: some View {
		HStack(alignment: .top, spacing: 40) {
			// Inputs
			VStack {
				LogicNode(label: "A", active: store.inputA)
			}
			.padding(.top, 20)
			
			// Gate
			VStack {
				Image(store.output ? "NOT_On" : "NOT").resizable().frame(width: 60, height: 60)
			}
			
			// Output
			VStack {
				LogicNode(label: "O", active: store.output, output: true)
			}
			.padding(.top, 20)
		}
	}
}
