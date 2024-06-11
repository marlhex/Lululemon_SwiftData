//
//  AddGarmentView.swift
//  Lululemon
//
//  Created by Ignacio Arias on 2024-04-15.
//

//import SwiftUI
//import SwiftData
//
//struct AddGarmentView: View {
//    @Environment(\.modelContext) private var modelContext
//
//    @Binding var isPresented: Bool
//    @State private var garmentName = ""
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading, spacing: 10) {
//                Divider()
//
//                Text("Garment Name:")
//                    .padding()
//
//                TextField("Garment Name", text: $garmentName)
//                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.gray, lineWidth: 1)
//                            .background(Color.white)
//                    )
//
//                Spacer()
//            }
//            .padding()
//
//            .navigationTitle("Add garments")
//            .navigationBarTitleDisplayMode(.inline)
//
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button("Cancel") {
//                        isPresented = false
//                    }
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Save") {
//                        let newGarment = Garment(name: garmentName, creationTime: Date())
//                        modelContext.insert(newGarment)
//                        isPresented = false
//                    }
//                    .disabled(garmentName.isEmpty)
//                }
//            }
//        }
//    }
//}

import SwiftUI
import SwiftData

struct AddGarmentView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isPresented: Bool
    @State private var garmentName = ""
    @FocusState private var isInputActive: Bool

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Divider()

                Text("Garment Name:")
                    .padding()

                TextField("Garment Name", text: $garmentName)
                    .focused($isInputActive)
                    .onAppear {
                        self.isInputActive = true
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                            .background(Color.white)
                    )
                    .scaleEffect(isInputActive ? 1.0 : 0.5)
                    .animation(.easeInOut(duration: 0.5), value: isInputActive)

                Spacer()
            }
            .padding()
            .navigationTitle("Add garments")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newGarment = Garment(name: garmentName)
                        modelContext.insert(newGarment)
                        isPresented = false
                    }
                    .disabled(garmentName.isEmpty)
                }
            }
        }
    }
}


#Preview {
    let isPresented = Binding<Bool>.constant(true)
    return AddGarmentView(isPresented: isPresented)
}
