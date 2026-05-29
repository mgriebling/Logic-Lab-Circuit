//
//  MainView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    @Bindable var store: StoreOf<MainFeature>
    
	var body: some View {
		VStack {
			Text("Logic Lab Circuit").bold()
				.font(.title)
			Text("Simulator")
				.font(.title3)
			
			// Picker for selecting operation
			Picker("Operation", selection: $store.selectedOperation.sending(\.operationChanged).animation(.default)) {
				ForEach(ALUOperation.allCases, id: \.self) { operation in
					Text(operation.rawValue + " Logic Circuit").tag(operation)
				}
			}
			// .pickerStyle(.wheel)
			.padding(.horizontal)
			
			Divider()
			
			ScrollView(.vertical, showsIndicators: false) {
				VStack(spacing: 20) {
					// Dynamically display the selected view
					Group {
						switch store.selectedOperation {
						case .add:
							ADDView(store: store.scope(state: \.addFeature, action: \.addFeature))
						case .sub:
							SUBView(store: store.scope(state: \.subFeature, action: \.subFeature))
						case .andGate:
							ANDView(store: store.scope(state: \.andFeature, action: \.andFeature))
						case .nandGate:
							NANDView(store: store.scope(state: \.nandFeature, action: \.nandFeature))
						case .notGate:
							NOTView(store: store.scope(state: \.notFeature, action: \.notFeature))
						case .orGate:
							ORView(store: store.scope(state: \.orFeature, action: \.orFeature))
						case .norGate:
							NORView(store: store.scope(state: \.norFeature, action: \.norFeature))
						case .xorGate:
							XORView(store: store.scope(state: \.xorFeature, action: \.xorFeature))
						case .xnorGate:
							XNORView(store: store.scope(state: \.xnorFeature, action: \.xnorFeature))
						}
					}
					.frame(maxHeight: 300)
					
					// Inputs below the picker
					HStack {
						VStack {
							Text("Input A")
							Toggle("", isOn: $store.inputA.sending(\.inputAChanged))
							.labelsHidden()
							.padding(.horizontal)
						}
						
						if store.selectedOperation != .notGate {
							VStack {
								Text("Input B")
								Toggle("", isOn: $store.inputB.sending(\.inputBChanged))
									.labelsHidden()
									.padding(.horizontal)
							}
						}
						
						if store.selectedOperation == .add || store.selectedOperation == .sub {
							VStack {
								Text(store.selectedOperation == .sub ? "Input Bi" : "Input Ci")
								Toggle("", isOn: $store.inputCi.sending(\.inputCiChanged))
								.labelsHidden()
								.padding(.horizontal)
							}
						}
					}
					
					// Basic Formula of the Logic Circuit
					VStack(alignment: .leading, spacing: 20) {
						VStack(alignment: .leading) {
							Text("Formula:")
								.font(.headline)
							VStack(alignment: .leading, spacing: 5) {
								ForEach(getFormula(for: store.selectedOperation), id: \.self) { formula in
									Text("• \(formula)")
										.font(.body)
										.foregroundColor(.primary)
								}
							}
						}
						
						// Truth Table Section
						VStack(alignment: .leading) {
							TruthTableView(
								truthTable: getTruthTable(for: store.selectedOperation),
								title: "Truth Table:"
							)
						}
					}
					.padding(.horizontal)
				}
				.padding()
			}
			
			Spacer()
		}
		.onTapGesture {
			UIApplication.shared.endEditing()
		}
	}
	
	private func getFormula(for operation: ALUOperation) -> [String] {
		switch operation {
		case .add:
			["Sum (S): \(FullAdderFormula.sum)",
			 "Carry Out (Co): \(FullAdderFormula.carryOut)"]
		case .sub:
			["Difference (D): \(FullSubtractorFormula.difference)",
			 "Borrow (Bo): \(FullSubtractorFormula.borrow)"]
		case .notGate:
			["NOT Gate: \(NOTFormula.negation)"]
		case .andGate:
            ["AND Gate: \(ANDFormula.conjunction)"]
		case .nandGate:
			["NAND Gate: \(NANDFormula.nand)"]
		case .orGate:
            ["OR Gate: \(ORFormula.disjunction)"]
		case .norGate:
			["NOR Gate: \(NORFormula.nor)"]
		case .xorGate:
            ["XOR Gate: \(XORFormula.exclusiveOr)"]
		case .xnorGate:
			["XOR Gate: \(XNORFormula.exclusiveNor)"]
        }
    }
    
    private func getTruthTable(for operation: ALUOperation) -> TruthTable {
        switch operation {
        case .add:
			TruthTables.generateTable(for: .add,
									  inputs: ["A", "B", "C-IN"],
									  outputs: ["Sum", "C-OUT"])
        case .sub:
			TruthTables.generateTable(for: .sub,
									  inputs: ["A", "B", "B-IN"],
									  outputs: ["D", "B-OUT"])
        case .notGate:
			// all the 1-input operations
			TruthTables.generateTable(for: operation, inputs: ["A"])
        default:
			// all the 2-input operations
			TruthTables.generateTable(for: operation)
        }
    }
}

#Preview {
    MainView(
        store: Store(initialState: MainFeature.State()) {
            MainFeature()
        }
    )
}
