//
//  ProfileView.swift
//  GarageBase
//
//  Created by Ethan Hanlon on 6/23/21.
//

import SwiftUI
import FirebaseAuth

/**
 * Shows the user their logged in state and settings.
 */
struct ProfileView: View {
    /// Light or dark theme
    @Environment(\.colorScheme) var osTheme
    private let user = Auth.auth().currentUser
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                if osTheme == .light {
                    Colors.aureolin
                        .ignoresSafeArea()
                } else {
                    Colors.jet
                        .ignoresSafeArea()
                }
                
                VStack {
                    // MARK: - Top
                    HStack {
                        // Greeting
                        if user == nil {
                            Text("Hello, human!")
                                .font(.largeTitle)
                        } else {
                            Text("Hello, " + (user?.displayName ?? "human") + "!")
                                .font(.largeTitle)
                        }
                        
                        Spacer()
                    }
                    .padding(.leading)
                    
                    // Verify email
                    if let user = user {
                        HStack {
                            if !user.isEmailVerified {
                                Image(systemName: "x.circle")
                                    .resizable()
                                    .frame(width: 25, height: 25, alignment: .center)
                                    .foregroundColor(.red)
                                Text("Email unverified")
                                    .foregroundColor(.red)
                                Button(
                                    action: {
                                        // TODO
                                    },
                                    label: {
                                    Text("Verify email")
                                    Image(systemName: "chevron.right")
                                })
                            } else {
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .frame(width: 25, height: 25, alignment: .center)
                                Text("Email verified")
                            }
                            Spacer()
                        }
                        .padding(.leading)
                    }
                    
                    Divider()
                    Spacer()
                    
                    // MARK: - Middle
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    Spacer()
                    
                    // MARK: - Bottom
                    
                    HStack {
                        CustomStyledTextButton(text: "Register", icon: "person.fill.badge.plus") {
                            // TODO
                        }
                        .padding(.trailing)
                        
                        CustomStyledTextButton(text: "Sign in", icon: "signature") {
                            // TODO
                        }
                        .padding(.leading)
                    }
                    .padding(.horizontal)
                    
                }
                // This padding is used to separate from the TabView on the bottom
                .padding(.bottom)
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
