//
//  SUBView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct SUBView: View {
    let store: StoreOf<SUBFeature>

	var body: some View {
		VStack(spacing: 0) {
			Text("Full Subtractor Circuit")
				.font(.title3)
				.bold()
			
			ZStack {
				SUBWirePath(store: store)
				SUBGateLayout(store: store)
			}
			.frame(width: 360, height: 300)
			.onAppear {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputA) {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputB) {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputBi) {
				store.send(.computeOutput)
			}
		}
	}
}

#Preview {
    SUBView(
        store: Store(initialState: SUBFeature.State(inputA: true, inputB: true, inputBi: false)) {
            SUBFeature()
        }
    )
}
