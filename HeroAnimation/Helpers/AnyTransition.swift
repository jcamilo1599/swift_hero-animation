//
//  AnyTransition.swift
//  HeroAnimation
//
//  Created by Juan Camilo Marín Ochoa on 24/09/22.
//

import SwiftUI

extension AnyTransition {
    static let heroAnimation = AnyTransition.modifier(
        active: HeroModifier(percentage: 1),
        identity: HeroModifier(percentage: 0)
    )
    
    struct HeroModifier: AnimatableModifier {
        var percentage: Double
        var animatableData: Double {
            get {
                percentage
            }
            
            set {
                percentage = newValue
            }
        }
        
        
        func body(content: Content) -> some View {
            content.opacity(1)
        }
    }
}
