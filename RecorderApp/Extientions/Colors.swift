//
//  Colors.swift
//  RecorderApp
//
//  Created by Rahaf Aldosary on 11/06/1444 AH.
//

import SwiftUI

extension Color {
    
    static func rgb(r: Double, g:Double, b:Double) -> Color {
        return Color(red: r / 255, green: g / 255 , blue: b / 255)
    }
    
    static let backgroundColor = Color.rgb(r: 27, g: 18, b: 52)
    static let outlineColor = Color.rgb(r: 255, g: 123, b: 67)
    static let pulsatingColor = Color.rgb(r: 243, g: 173, b: 143)
    static let bg1 = Color.rgb(r: 30, g: 91, b: 91)

    //recordings
    static let rec1 = Color.rgb(r: 30, g: 91, b: 91)
    static let rec2 = Color.rgb(r: 22, g: 67, b: 100)
    static let rec3 = Color.rgb(r: 47, g: 61, b: 78)

}
