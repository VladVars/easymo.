//
//  CircleProgress.swift
//  easymo.
//
//  Created by mac on 17.07.22.
//

import Foundation
import UIKit
import SwiftUI

class CircleProgress: UIView {

    override convenience init(frame: CGRect) {
        self.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @Binding var progress: Float
    var color: Color = .red
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.20)
                .foregroundColor(.gray)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2.0))
        }
    }
}
