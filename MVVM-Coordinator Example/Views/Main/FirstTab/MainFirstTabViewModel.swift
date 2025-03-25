//
//  MainFirstTabViewModel.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 23/03/2025.
//

import SwiftUI

class MainFirstTabViewModel: ObservableObject {
    @Published var name: String = "Bob"
    @Published var message: String = "Hello World"
}
