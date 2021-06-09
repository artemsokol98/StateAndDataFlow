//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

import Combine
import SwiftUI

class UserManager: ObservableObject {
    @AppStorage("state") var isRegister = false
    @AppStorage("person") var name: String = ""
    
}

