//
//  Line.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 29.05.2026.
//

import SwiftUI

struct Line {
	
	static func activeColor(_ state: Bool) -> Color {
		state ? activeColor : inactiveColor
	}
	
	static func line(from: CGPoint, to: CGPoint, active: Bool) -> some View {
		Path { path in
			path.move(to: from)
			path.addLine(to: to)
		}
		.stroke(activeColor(active), lineWidth: width)
	}
	
	static func dot(at x: CGPoint, active: Bool) -> some View {
		// Draw dot at x
		Path { path in
			path.addEllipse(in: CGRect(x: x.x - radius, y: x.y - radius,
									   width: radius * 2, height: radius * 2))
		}
		.stroke(activeColor(active), lineWidth: width)
	}
	
	static func hline(from x: CGPoint, length: CGFloat, active: Bool) -> some View {
		hvlines(from: x, offsets: [length], active: active)
	}
	
	static func hvlines(from x: CGPoint, offsets: [CGFloat], active: Bool, dot: Bool = false) -> some View {
		Path { path in
			let r2 = radius * 2
			let r = radius
			var x = x
			if dot {
				path.addEllipse(in: CGRect(x: x.x - r, y: x.y - r, width: r2, height: r2))
			}
			path.move(to: x)
			for (index, length) in offsets.enumerated() {
				if index.isMultiple(of: 2) {
					x.x += length
				} else {
					x.y += length
				}
				path.addLine(to: x)
			}
		}
		.stroke(activeColor(active), lineWidth: width)
	}
	
	static func vhlines(from x: CGPoint, offsets: [CGFloat], active: Bool, dot: Bool = false) -> some View {
		// initial point is same as x so no line is drawn but we can reuse hvlines code
		hvlines(from: x, offsets: [0] + offsets, active: active, dot: dot)
	}
	
	static func vline(from x: CGPoint, length: CGFloat, active: Bool) -> some View {
		vhlines(from: x, offsets: [length], active: active)
	}
	
	static let activeColor = Color.green
	static let inactiveColor = Color.gray
	static let width: CGFloat = 3
	static let radius: CGFloat = 3
}
