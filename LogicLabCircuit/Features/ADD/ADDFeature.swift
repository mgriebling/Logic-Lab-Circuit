//
//  ADDFeature.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/09/25.
//

import ComposableArchitecture
import Foundation

@Reducer
struct ADDFeature {
    @ObservableState
     struct State: Equatable {
        var inputA: Bool = false
        var inputB: Bool = false
        var inputCi: Bool = false
        var outputS: Bool = false
        var outputCo: Bool = false
    }
    
    enum Action {
        case inputAChanged(Bool)
        case inputBChanged(Bool)
        case inputCiChanged(Bool)
        case computeOutput
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .inputAChanged(value):
                state.inputA = value
                return .run { send in
                    await send(.computeOutput)
                }
                
            case let .inputBChanged(value):
                state.inputB = value
                return .run { send in
                    await send(.computeOutput)
                }
                
            case let .inputCiChanged(value):
                state.inputCi = value
                return .run { send in
                    await send(.computeOutput)
                }
                
            case .computeOutput:
				(state.outputS, state.outputCo) =
					ALUModel.compute(a: state.inputA,
									 b: state.inputB,
									 c: state.inputCi,
									 operation: .add)
                return .none
            }
        }
    }
}
