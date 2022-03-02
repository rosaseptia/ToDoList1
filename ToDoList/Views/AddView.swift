//
//  AddView.swift
//  ToDoList
//
//  Created by Septia Rosalina Malik on 02/03/22.
//

import SwiftUI

struct AddView: View {
     
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(red: 0.835, green: 0.835, blue: 0.831, opacity: 0.803))
                    .cornerRadius(10)
                Button(action: saveButtenPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }.padding(.horizontal)
            
        }
        .navigationTitle("Add an Item ✒️")
        
        
    }
    func saveButtenPressed() {
        listViewModel.addItem(title: textFieldText)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
        
    }
}
