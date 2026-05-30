//
//  MainFeature.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/09/25.
//

import ComposableArchitecture
import Foundation

@Reducer
struct MainFeature {
    @ObservableState
    struct State: Equatable {
        var inputA: Bool = false
        var inputB: Bool = false
        var inputCi: Bool = false
        var selectedOperation: ALUOperation = .add
		var selectedKind: OperationKind = .math
        var result: Bool = false
        var isTapped: Bool = false
        
        // Child feature states
        var addFeature = ADDFeature.State()
        var subFeature = SUBFeature.State()
		var notFeature = NOTFeature.State()
        var andFeature = ANDFeature.State()
		var nandFeature = NANDFeature.State()
        var orFeature = ORFeature.State()
		var norFeature = NORFeature.State()
        var xorFeature = XORFeature.State()
		var xnorFeature = XNORFeature.State()
    }
    
    enum Action {
        case inputAChanged(Bool)
        case inputBChanged(Bool)
        case inputCiChanged(Bool)
        case operationChanged(ALUOperation)
		case kindChanged(OperationKind)
        case isTappedChanged(Bool)
        case computeResult
        
        // Child feature actions
        case addFeature(ADDFeature.Action)
        case subFeature(SUBFeature.Action)
		case notFeature(NOTFeature.Action)
        case andFeature(ANDFeature.Action)
		case nandFeature(NANDFeature.Action)
        case orFeature(ORFeature.Action)
		case norFeature(NORFeature.Action)
        case xorFeature(XORFeature.Action)
		case xnorFeature(XNORFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.addFeature, action: \.addFeature) {
            ADDFeature()
        }
        
        Scope(state: \.subFeature, action: \.subFeature) {
            SUBFeature()
        }
		
		Scope(state: \.notFeature, action: \.notFeature) {
			NOTFeature()
		}
        
        Scope(state: \.andFeature, action: \.andFeature) {
            ANDFeature()
        }
		
		Scope(state: \.nandFeature, action: \.nandFeature) {
			NANDFeature()
		}
        
        Scope(state: \.orFeature, action: \.orFeature) {
            ORFeature()
        }
		
		Scope(state: \.norFeature, action: \.norFeature) {
			NORFeature()
		}
        
        Scope(state: \.xorFeature, action: \.xorFeature) {
            XORFeature()
        }
		
		Scope(state: \.xnorFeature, action: \.xnorFeature) {
			XNORFeature()
		}
        
        Reduce { state, action in
            switch action {
            case let .inputAChanged(value):
                state.inputA = value
                // Update all child features
                state.addFeature.inputA = value
                state.subFeature.inputA = value
				state.notFeature.inputA = value
                state.andFeature.inputA = value
				state.nandFeature.inputA = value
                state.orFeature.inputA = value
				state.norFeature.inputA = value
                state.xorFeature.inputA = value
				state.xnorFeature.inputA = value
                return .run { send in
                    await send(.computeResult)
                }
                
            case let .inputBChanged(value):
                state.inputB = value
                // Update all child features
                state.addFeature.inputB = value
                state.subFeature.inputB = value
                state.andFeature.inputB = value
				state.nandFeature.inputB = value
                state.orFeature.inputB = value
				state.norFeature.inputB = value
                state.xorFeature.inputB = value
				state.xnorFeature.inputB = value
                return .run { send in
                    await send(.computeResult)
                }
                
            case let .inputCiChanged(value):
                state.inputCi = value
                // Update relevant child features
                state.addFeature.inputCi = value
                state.subFeature.inputBi = value
                return .run { send in
                    await send(.computeResult)
                }
                
            case let .operationChanged(operation):
                state.selectedOperation = operation
                return .run { send in
                    await send(.computeResult)
                }
					
			case let .kindChanged(kind):
				state.selectedKind = kind
				state.selectedOperation = ALUOperation.getOperations(for: kind).first ?? .add
				return .run { send in
					await send(.computeResult)
				}
                
            case let .isTappedChanged(value):
                state.isTapped = value
                return .none
                
            case .computeResult:
				state.result = ALUModel.compute(aIn: state.inputA,
												bIn: state.inputB,
												operation: state.selectedOperation)
                return .none
                
            case .addFeature, .subFeature, .notFeature, .andFeature, .nandFeature, .orFeature, .norFeature, .xorFeature, .xnorFeature:
                return .none
            }
        }
    }
}
