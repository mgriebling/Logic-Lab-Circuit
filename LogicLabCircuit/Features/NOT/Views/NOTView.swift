//
//  NOTView.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct NOTView: View {
	let store: StoreOf<NOTFeature>
	
	var body: some View {
		VStack(spacing: 0) {
			Text("NOT Logic Gate")
				.font(.title3)
				.bold()
			
			ZStack {
				NOTWirePath(store: store)
				NOTGateLayout(store: store)
			}
			.frame(width: 360, height: 150)
			.onAppear {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputA) {
				store.send(.computeOutput)
			}
		}
	}
}

#Preview {
    NOTView(
        store: Store(initialState: NOTFeature.State(inputA: true)) {
            NOTFeature()
        }
    )
}
