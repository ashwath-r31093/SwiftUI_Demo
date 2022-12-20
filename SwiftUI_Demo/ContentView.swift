//
//  ContentView.swift
//  SwiftUI_Demo
//
//  Created by Ashwath Ramanan on 20/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        viewModel.fetchList()
    }
    
    var body: some View {
        List(viewModel.people) { person in
            HStack {
                Text(person.name)
                Spacer()
                Text(person.language ?? "")
            }
        }
    }
}
