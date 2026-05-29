//
//  NORView.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct NORView: View {
	let store: StoreOf<NORFeature>
	
	var body: some View {
		VStack(spacing: 0) {
			Text("NOR Logic Gate")
				.font(.title3)
				.bold()
			
			ZStack {
				NORWirePath(store: store)
				NORGateLayout(store: store)
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
    NORView(
		store: Store(initialState: NORFeature.State(inputA: true, inputB: false)) {
            NORFeature()
        }
    )
}
