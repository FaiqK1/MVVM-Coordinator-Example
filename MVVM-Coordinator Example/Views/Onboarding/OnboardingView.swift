//
//  OnboardingView.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import SwiftUI

struct OnboardingView: View {
    var action: () -> ()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            tabView()
            
            skipButtonView()
        }
    }
    
    @ViewBuilder func tabView() -> some View {
        TabView {
            ForEach(0..<3, id: \.self) { index in
                VStack {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Page \(index + 1)")
                        .font(.title)
                }
                .foregroundStyle(Color(red: .random(in: 0.5...1),
                                       green: .random(in: 0.5...1),
                                       blue: .random(in: 0.5...1)))
                .padding()
                .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .background(
            Color.black
                .ignoresSafeArea(.all)
        )
    }
    
    @ViewBuilder func skipButtonView() -> some View {
        Button {
            action()
        } label: {
            Text("Skip")
                .foregroundStyle(.black)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                )
        }
        .padding()
    }
}

#Preview {
    OnboardingView { }
}
