//
//  MainFirstDetailView.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import SwiftUI

struct MainFirstDetailView: View {
    @ObservedObject var viewModel: MainFirstTabViewModel
    let textfieldHeight: CGFloat = 44
    
    var body: some View {
        VStack {
            Text("First Detail View (SwiftUI)")
                .font(.title)
            
            TextField("name", text: $viewModel.name)
                .frame(height: textfieldHeight)
                .textFieldStyle(.roundedBorder)
            
            TextField("message", text: $viewModel.message)
                .frame(height: textfieldHeight)
                .textFieldStyle(.roundedBorder)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .padding()
        .background(Color.purple)
    }
}

#Preview {
    MainFirstDetailView(viewModel: MainFirstTabViewModel())
}
