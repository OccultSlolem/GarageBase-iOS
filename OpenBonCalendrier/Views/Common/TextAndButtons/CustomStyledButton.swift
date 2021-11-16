//
//  CustomStyledTextButton.swift
//  GarageBase
//
//  Created by Ethan Hanlon on 6/25/21.
//

import SwiftUI

struct CustomStyledButton: View {
    /// Text to display on the button
    var text: String?
    /// Should be an SF icon string
    var icon: String?
    /// Button background color. Will default to cyber yellow if no color specified
    var backgroundColor: Color? = Colors.jet
    /// Button text color. Will default to eerie black if no color specified
    var textColor: Color? = Colors.cyberYellow
    /// Action to execute when button is activated
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                
                if let icon = icon {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .scaledToFit()
                        .foregroundColor(textColor)
                }
                
                if let text = text {
                    Text(text)
                        .padding()
                        .accentColor(.white)
                        .font(.title2)
                        .foregroundColor(textColor)
                }
                
                Spacer()
            }
            .background(RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(backgroundColor)
            )
            
            .cornerRadius(16)
        }
    }
}

struct CustomStyledTextButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Colors.aureolin
                .ignoresSafeArea()
            CustomStyledButton(text: "String", icon: "person.circle") {
                print(":)")
            }
        }
    }
}
