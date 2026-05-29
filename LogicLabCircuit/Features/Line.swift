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
		Path { path in
			// Dot
			path.addEllipse(in: CGRect(x: x.x - radius, y: x.y - radius, width: radius * 2, height: radius * 2))
		}
		.stroke(activeColor(active), lineWidth: width)
	}
	
	static func hline(from: CGPoint, length: CGFloat, active: Bool) -> some View {
		line(from: from, to: CGPoint(x: from.x + length, y: from.y), active: active)
	}
	
	static func vline(from: CGPoint, length: CGFloat, active: Bool) -> some View {
		line(from: from, to: CGPoint(x: from.x, y: from.y + length), active: active)
	}
	
	static let activeColor = Color.green
	static let inactiveColor = Color.gray
	static let width: CGFloat = 3
	static let radius: CGFloat = 3
}
