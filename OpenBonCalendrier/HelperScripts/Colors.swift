//
//  Colors.swift
//  GarageBase
//
//  Created by Ethan Hanlon on 6/22/21.
//

import Foundation
import SwiftUI

struct Colors {
    // Color scheme can be found at https://coolors.co/f8e91f-ffd100-d6d6d6-333533-202020
    public static let aureolin = Color(hex: 0xF8E91F)
    public static let cyberYellow = Color(hex: 0xFFD100)
    public static let lightGray = Color(hex: 0xD6D6D6)
    public static let jet = Color(hex: 0x333533)
    public static let eerieBlack = Color(hex: 0x202020)
    
}

// With thanks to Sam Soffes on StackOverflow
// Convert hex code to UIColor
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct ColorSquare: View {
    let color: Color
    let colorName: String
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(color)
                .shadow(radius: 10)
            
            Text(colorName)
        }
        .padding(.horizontal)
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                ColorSquare(color: Colors.aureolin, colorName: "Aureolin")
                ColorSquare(color: Colors.cyberYellow, colorName: "Cyber Yellow")
            }
            HStack {
                ColorSquare(color: Colors.lightGray, colorName: "Light Gray")
                ColorSquare(color: Colors.jet, colorName: "Jet")
                ColorSquare(color: Colors.eerieBlack, colorName: "Eerie Black")
            }
        }
    }
}
