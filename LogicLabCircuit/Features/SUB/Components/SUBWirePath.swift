//
//  SUBWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct SUBWirePath: View {
    let store: StoreOf<SUBFeature>
    let activeColor = Color.green
    let inactiveColor = Color.gray
    let radius: CGFloat = 3.0

	var body: some View {
		let xorAB = store.inputA != store.inputB
		let xnorAB = !(store.inputA != store.inputB)
		let notA = !store.inputA
		ZStack {
			// Bin to XOR2
			Path { path in
				path.move(to: CGPoint(x: 18, y: 57.5))
				path.addLine(to: CGPoint(x: 260, y: 57.5))
			}
			.stroke(store.inputBi ? activeColor : inactiveColor, lineWidth: 3)
			
			// Dot at Bin to AND2
			Path { path in
				path.addEllipse(in: CGRect(x: 125 - radius, y: 57.5 - radius, width: radius * 2, height: radius * 2))
			}
			.stroke(store.inputBi ? activeColor : inactiveColor, lineWidth: 3)
			
			// Bin to XOR2
			Path { path in
				path.move(to: CGPoint(x: 125, y: 57.5))
				path.addLine(to: CGPoint(x: 125, y: 180))
				path.move(to: CGPoint(x: 125, y: 180))
				path.addLine(to: CGPoint(x: 215, y: 180))
			}
			.stroke(store.inputBi ? activeColor : inactiveColor, lineWidth: 3)
			
			// XOR2 to D
			Path { path in
				path.move(to: CGPoint(x: 295, y: 70))
				path.addLine(to: CGPoint(x: 350, y: 70))
			}
			.stroke(store.outputD ? activeColor : inactiveColor, lineWidth: 3)
			
			// A to XOR1
			Path { path in
				path.move(to: CGPoint(x: 18, y: 97.5))
				path.addLine(to: CGPoint(x: 63, y: 97.5))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			// B to XOR1
			Path { path in
				path.move(to: CGPoint(x: 18, y: 127.5))
				path.addLine(to: CGPoint(x: 65, y: 127.5))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			// A to NOT1
			Path { path in
				path.move(to: CGPoint(x: 30, y: 97.5))
				path.addLine(to: CGPoint(x: 30, y: 222.5))
				path.addLine(to: CGPoint(x: 65, y: 222.5))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			// Dot at A to NOT1
			Path { path in
				path.addEllipse(in: CGRect(x: 30 - radius, y: 97.5 - radius, width: radius * 2, height: radius * 2))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			// NOT1 to AND1
			Path { path in
				path.move(to: CGPoint(x: 92.5, y: 222.5))
				path.addLine(to: CGPoint(x: 110, y: 222.5))
			}
			.stroke(notA ? activeColor : inactiveColor, lineWidth: 3)
			
			// B to AND1
			Path { path in
				path.move(to: CGPoint(x: 50, y: 127.5))
				path.addLine(to: CGPoint(x: 50, y: 245))
				path.addLine(to: CGPoint(x: 110, y: 245))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			// Dot at B to AND1
			Path { path in
				path.addEllipse(in: CGRect(x: 50 - radius, y: 127.5 - radius, width: radius * 2, height: radius * 2))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			// XOR1 to NOT2
			Path { path in
				path.move(to: CGPoint(x: 102.5, y: 115))
				path.addLine(to: CGPoint(x: 140, y: 115))
				path.addLine(to: CGPoint(x: 140, y: 160))
				path.addLine(to: CGPoint(x: 165, y: 160))
			}
			.stroke(xorAB ? activeColor : inactiveColor, lineWidth: 3)
			
			// Dot at XOR1 to XOR2
			Path { path in
				path.addEllipse(in: CGRect(x: 140 - radius, y: 115 - radius, width: radius * 2, height: radius * 2))
			}
			.stroke(xorAB ? activeColor : inactiveColor, lineWidth: 3)
			
			// XOR1 to XOR2
			Path { path in
				path.move(to: CGPoint(x: 140, y: 115))
				path.addLine(to: CGPoint(x: 245, y: 115))
				path.addLine(to: CGPoint(x: 245, y: 85))
				path.addLine(to: CGPoint(x: 257.5, y: 85))
			}
			.stroke(xorAB ? activeColor : inactiveColor, lineWidth: 3)
			
			// NOT2 to AND2
			Path { path in
				path.move(to: CGPoint(x: 187.5, y: 160))
				path.addLine(to: CGPoint(x: 215, y: 160))
			}
			.stroke(xnorAB ? activeColor : inactiveColor, lineWidth: 3)
			
			// AND2 to OR
			Path { path in
				path.move(to: CGPoint(x: 250, y: 167.5))
				path.addLine(to: CGPoint(x: 280, y: 167.5))
			}
			.stroke(xnorAB && store.inputBi ? activeColor : inactiveColor, lineWidth: 3)
			
			// AND1 to OR
			Path { path in
				path.move(to: CGPoint(x: 150, y: 230))
				path.addLine(to: CGPoint(x: 260, y: 230))
				path.addLine(to: CGPoint(x: 260, y: 190))
				path.addLine(to: CGPoint(x: 280, y: 190))
			}
			.stroke((store.inputB && notA) ? activeColor : inactiveColor, lineWidth: 3)
			
			// OR to Bo
			Path { path in
				path.move(to: CGPoint(x: 317.5, y: 177.5))
				path.addLine(to: CGPoint(x: 345, y: 177.5))
			}
			.stroke(store.outputBo ? activeColor : inactiveColor, lineWidth: 3)
		}
	}
}
