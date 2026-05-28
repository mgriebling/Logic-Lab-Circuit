//
//  ADDWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ADDWirePath: View {
	let store: StoreOf<ADDFeature>
	let activeColor = Color.green
	let inactiveColor = Color.gray
	let radius: CGFloat = 3.0
	
	var body: some View {
		let andAB = store.inputA && store.inputB
		let xorAB = store.inputA != store.inputB
		ZStack {
			// A to XOR1
			Path { path in
				path.move(to: CGPoint(x: 18, y: 25))
				path.addLine(to: CGPoint(x: 65, y: 25))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			// B to XOR1
			Path { path in
				path.move(to: CGPoint(x: 18, y: 65))
				path.addLine(to: CGPoint(x: 65, y: 65))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			// XOR1 output to XOR2
			Path { path in
				path.move(to: CGPoint(x: 118, y: 45))
				path.addLine(to: CGPoint(x: 150, y: 45))
				path.addLine(to: CGPoint(x: 150, y: 45))
				path.addLine(to: CGPoint(x: 150, y: 65))
				// Dot
				path.addEllipse(in: CGRect(x: 150 - radius, y: 65 - radius, width: radius * 2, height: radius * 2))
				path.addLine(to: CGPoint(x: 150, y: 65))
				path.addLine(to: CGPoint(x: 190, y: 65))
			}
			.stroke(xorAB ? activeColor : inactiveColor, lineWidth: 3)
			
			// Cin to XOR2
			Path { path in
				path.move(to: CGPoint(x: 18, y: 105))
				path.addLine(to: CGPoint(x: 80, y: 105))
				
				// Dot at Cin to XOR2
				path.addLine(to: CGPoint(x: 80, y: 95))
				path.addLine(to: CGPoint(x: 80, y: 105))
				path.addLine(to: CGPoint(x: 80, y: 95))
				path.addLine(to: CGPoint(x: 193, y: 95))
			}
			.stroke(store.inputCi ? activeColor : inactiveColor, lineWidth: 3)
			
			// Dot at Cin to XOR2 and AND2
			Path { path in
				// Dot
				path.addEllipse(in: CGRect(x: 80 - radius, y: 105 - radius, width: radius * 2, height: radius * 2))
			}
			.stroke(store.inputCi ? activeColor : inactiveColor, lineWidth: 3)
			
			// XOR2 output to SUM
			Path { path in
				path.move(to: CGPoint(x: 228, y: 80))
				path.addLine(to: CGPoint(x: 340, y: 80))
			}
			.stroke(store.outputS ? activeColor : inactiveColor, lineWidth: 3)
			
			// dot at A to AND1
			Path { path in
				path.addEllipse(in: CGRect(x: 50 - radius, y: 25 - radius, width: radius * 2, height: radius * 2))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				path.move(to: CGPoint(x: 50, y: 25))
				path.addLine(to: CGPoint(x: 50, y: 240))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				path.move(to: CGPoint(x: 50, y: 240))
				path.addLine(to: CGPoint(x: 115, y: 240))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			// dot at B to AND1
			Path { path in
				path.addEllipse(in: CGRect(x: 30 - radius, y: 65 - radius, width: radius * 2, height: radius * 2))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				path.move(to: CGPoint(x: 30, y: 65))
				path.addLine(to: CGPoint(x: 30, y: 270))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				path.move(to: CGPoint(x: 30, y: 270))
				path.addLine(to: CGPoint(x: 115, y: 270))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			// Dot at Cin to AND2
			Path { path in
				path.move(to: CGPoint(x: 80, y: 105))
				path.addLine(to: CGPoint(x: 80, y: 150))
				path.addLine(to: CGPoint(x: 80, y: 150))
				path.addLine(to: CGPoint(x: 115, y: 150))
			}
			.stroke(store.inputCi ? activeColor : inactiveColor, lineWidth: 3)
			
			// XOR1 output to AND2
			Path { path in
				path.move(to: CGPoint(x: 150, y: 65))
				path.addLine(to: CGPoint(x: 150, y: 120))
				path.addLine(to: CGPoint(x: 150, y: 120))
				path.addLine(to: CGPoint(x: 95, y: 120))
				path.addLine(to: CGPoint(x: 95, y: 120))
				path.addLine(to: CGPoint(x: 95, y: 180))
				path.addLine(to: CGPoint(x: 95, y: 180))
				path.addLine(to: CGPoint(x: 110, y: 180))
			}
			.stroke(xorAB ? activeColor : inactiveColor, lineWidth: 3)
			
			// AND1 output to OR
			Path { path in
				path.move(to: CGPoint(x: 160, y: 165))
				path.addLine(to: CGPoint(x: 190, y: 165))
				path.addLine(to: CGPoint(x: 190, y: 165))
				path.addLine(to: CGPoint(x: 190, y: 180))
				path.addLine(to: CGPoint(x: 190, y: 180))
				path.addLine(to: CGPoint(x: 240, y: 180))
			}
			.stroke(andAB ? inactiveColor : store.outputCo ? activeColor : inactiveColor, lineWidth: 3)
			
			// AND2 output to OR
			Path { path in
				path.move(to: CGPoint(x: 160, y: 255))
				path.addLine(to: CGPoint(x: 190, y: 255))
				path.addLine(to: CGPoint(x: 190, y: 255))
				path.addLine(to: CGPoint(x: 190, y: 210))
				path.addLine(to: CGPoint(x: 190, y: 210))
				path.addLine(to: CGPoint(x: 240, y: 210))
			}
			.stroke(store.outputCo ? activeColor : inactiveColor, lineWidth: 3)
			
			// OR output to COUT
			Path { path in
				path.move(to: CGPoint(x: 278, y: 195))
				path.addLine(to: CGPoint(x: 340, y: 195))
			}
			.stroke(store.outputCo ? activeColor : inactiveColor, lineWidth: 3)
		}
	}
}
