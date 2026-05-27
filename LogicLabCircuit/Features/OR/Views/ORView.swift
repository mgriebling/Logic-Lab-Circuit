//
//  ORView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ORView: View {
	let store: StoreOf<ORFeature>
	
	var body: some View {
		VStack(spacing: 0) {
			Text("OR Logic Gate")
				.font(.title3)
				.bold()
			
			ZStack {
				ORWirePath(store: store)
				ORGateLayout(store: store)
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
		}
	}
}

#Preview {
    ORView(
        store: Store(initialState: ORFeature.State(inputA: false, inputB: true)) {
            ORFeature()
        }
    )
}
