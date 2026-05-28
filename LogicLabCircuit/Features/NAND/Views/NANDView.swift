//
//  ANDView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct NANDView: View {
    let store: StoreOf<NANDFeature>

	var body: some View {
		VStack(spacing: 0) {
			Text("NAND Logic Gate")
				.font(.title3)
				.bold()
			
			ZStack {
				NANDWirePath(store: store)
				NANDGateLayout(store: store)
			}
			.frame(width: 380, height: 150)
			.onAppear {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputA) {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputB) {
				store.send(.computeOutput)
			}
		}
	}
}

#Preview {
    NANDView(
        store: Store(initialState: NANDFeature.State(inputA: true, inputB: false)) {
            NANDFeature()
        }
    )
}
