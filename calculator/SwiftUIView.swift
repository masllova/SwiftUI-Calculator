//
//  SwiftUIView.swift
//  calculator
//
//  Created by Александра Маслова on 01.02.2023.
//

import SwiftUI

struct BNView: View {
    let text: String
    var body: some View {
     Text(text)
            .font(.system(size: 40))
            .foregroundColor(Color.black)
            .frame(width: 85, height: 85)
            .background(RoundedRectangle(cornerRadius: 20)).foregroundColor(Color(myC1))
            .padding(1)
    }
}

struct BigBView: View {
    let text: String
    var color: Color
    var body: some View {
     Text(text)
            .font(.system(size: 40))
            .foregroundColor(Color.black)
            .frame(width: 180, height: 85)
            .background(RoundedRectangle(cornerRadius: 20)).foregroundColor(color)
            .padding(1)
    }
}

struct LargeBView: View {
    let text: String
    var body: some View {
     Text(text)
            .font(.system(size: 35, design: .monospaced))
            .foregroundColor(Color.black)
            .frame(width: 275, height: 85)
            .background(RoundedRectangle(cornerRadius: 20))
              .foregroundColor(Color(myC2))
              .padding(1)
    }
}

struct BOpView: View {
    let image: Image
    var color: Color
    var body: some View {
     Text(image)
            .font(.system(size: 40))
            .foregroundColor(Color.black)
            .frame(width: 85, height: 85)
            .background(RoundedRectangle(cornerRadius: 20)).foregroundColor(color)
            .padding(1)
    }
}
