//
//  ContentView.swift
//  Lululemon
//
//  Created by Ignacio Arias on 2024-04-15.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var isAddingGarment = false
    @State private var sortOrder = SortOption.alpha

    var body: some View {
        NavigationView {
            VStack {
                Picker("Sort Option", selection: $sortOrder) {
                    ForEach(SortOption.allCases) { sortOrder in
                        Text("Sort By \(sortOrder.rawValue)").tag(sortOrder)
                    }
                }
                
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                ListSortView(sortOrder: sortOrder)
                Spacer()
            }

            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                isAddingGarment = true
            }) {
                Image(systemName: "plus.circle")
            })
        }

        .fullScreenCover(isPresented: $isAddingGarment) {
            AddGarmentView(isPresented: $isAddingGarment)
        }
    }
}

#Preview {
    ContentView()
}
