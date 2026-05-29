//
//  SUBFeature.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/09/25.
//

import ComposableArchitecture
import Foundation

@Reducer
struct SUBFeature {
    @ObservableState
    struct State: Equatable {
        var inputA: Bool = false
        var inputB: Bool = false
        var inputBi: Bool = false
        var outputD: Bool = false // Difference
        var outputBo: Bool = false // Borrow
    }
    
    enum Action {
        case inputAChanged(Bool)
        case inputBChanged(Bool)
        case inputBiChanged(Bool)
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
                
            case let .inputBiChanged(value):
                state.inputBi = value
                return .run { send in
                    await send(.computeOutput)
                }
                
            case .computeOutput:
                (state.outputD, state.outputBo) =
					ALUModel.compute(
						a: state.inputA,
						b: state.inputB,
						c: state.inputBi,
						operation: .sub)
                return .none
            }
        }
    }
}
