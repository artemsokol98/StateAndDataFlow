//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, -70)
                CounterCharacters(text: $name)
                    .foregroundColor(colorToggle())
                    .padding(.trailing, 70)
                
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(checkNumberOfCharacters())
        }
    }
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
    
    private func checkNumberOfCharacters() -> Bool {
        (name.count < 3) ? true : false
    }
    
    private func colorToggle() -> Color {
        checkNumberOfCharacters() ? .black : .green
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct CounterCharacters: View {
    @Binding var text: String
    var counter: Int = 0
    
    init(text: Binding<String>) {
        self._text = text
        counter = self._text.wrappedValue.count
    }
    
    var body: some View {
        Text("\(counter)")
    }
}
