//
//  FormValid.swift
//  CupcakeCorner
//
//  Created by Bünyamin Kılıçer on 14.02.2022.
//

import SwiftUI

struct FormValidTest: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating account")
                }
            }
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

struct FormValidTest_Previews: PreviewProvider {
    static var previews: some View {
        FormValidTest()
    }
}
