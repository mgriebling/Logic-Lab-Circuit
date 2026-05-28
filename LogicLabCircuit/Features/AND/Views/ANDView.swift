//
//  ANDView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ANDView: View {
    let store: StoreOf<ANDFeature>

	var body: some View {
		VStack(spacing: 0) {
			Text("AND Logic Gate")
				.font(.title3)
				.bold()
			
			ZStack {
				ANDWirePath(store: store)
				ANDGateLayout(store: store)
			}
			.frame(width: 360, height: 150)
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
    ANDView(
        store: Store(initialState: ANDFeature.State(inputA: true, inputB: false)) {
            ANDFeature()
        }
    )
}
