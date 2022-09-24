//
//  ContentView.swift
//  HeroAnimation
//
//  Created by Juan Camilo Marín Ochoa on 24/09/22.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State var isExpanded = false
    @State var isAnimating = false
    
    var body: some View {
        ZStack {
            // Detalle
            if isExpanded {
                VStack {
                    ScrollView {
                        CardView()
                            .matchedGeometryEffect(id: "card", in: namespace)
                        
                        Text(
                        """
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        """
                        )
                        .padding()
                    }
                }
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
                .matchedGeometryEffect(id: "list", in: namespace)
                .edgesIgnoringSafeArea(.all)
                .transition(.heroAnimation)
                .onTapGesture {
                    withAnimation(.spring()) {
                        isExpanded = false
                    }
                    
                    isAnimating = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isAnimating = false
                    }
                }
                .disabled(isAnimating)
                .zIndex(2)
            }
            
            // Tarjeta
            VStack {
                CardView()
                    .matchedGeometryEffect(id: "card", in: namespace)
                    .frame(width: 340)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isExpanded = true
                        }
                        
                        isAnimating = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isAnimating = false
                        }
                    }
                    .disabled(isAnimating)
            }
            .matchedGeometryEffect(id: "list", in: namespace)
            .zIndex(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
