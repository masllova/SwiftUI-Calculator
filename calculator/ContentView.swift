//
//  ContentView.swift
//  calculator
//
//  Created by Александра Маслова on 10.01.2023.
//

import SwiftUI

let myC1 = #colorLiteral(red: 0.4339136481, green: 0.7249695659, blue: 0.5647780895, alpha: 0.7)
let myC2 = #colorLiteral(red: 0.1754944921, green: 0.4690407515, blue: 0.4485716224, alpha: 0.7)
let myC3 = #colorLiteral(red: 0.000322407519, green: 0.2672475576, blue: 0.2691194415, alpha: 0.7697382036)
let myC4 = #colorLiteral(red: 0, green: 0.2390134633, blue: 0.2450262308, alpha: 0.9)

enum Operation {
    case multiply
    case division
    case minus
    case plus
}

struct ContentView: View  {
    
    @State private var display: Double? {didSet {textOnDisp()}}
    @State private var firstValue: Double?
    @State private var setOperation: Operation?
    @State private var displayText: String = "0 "
     
    
    var body: some View {
        VStack (spacing: -5) {
            Spacer()
            HStack {
                ZStack {
                    Rectangle()
                        .stroke(Color(myC4), lineWidth: 5)
                        .frame(width: .infinity, height: 100)
                    HStack {
                        Spacer()
                        Text(displayText)
                            .foregroundColor(Color(myC4))
                            .font(.system(size: 60))
                            .lineLimit(1)
                    } .padding()
                }
            }
            
            VStack {
               HStack {
                    Button(action: {display = nil}, label: {LargeBView(text: "clear")})
                    Button(action: {operation(.division)}, label: {BOpView(image: Image(systemName: "divide"), color: Color(myC3))})
                }
               
                HStack {
                    Button(action: {typeNumb(7)}, label: {BNView(text: "7")})
                    Button(action: {typeNumb(8)}, label: {BNView(text: "8")})
                    Button(action: {typeNumb(9)}, label: {BNView(text: "9")})
                    Button(action: {operation(.multiply)}, label:
                            {BOpView(image: Image(systemName: "multiply"), color: Color(myC3))})
                }
                HStack {
                    Button(action: {typeNumb(4)}, label: {BNView(text: "4")})
                    Button(action: {typeNumb(5)}, label: {BNView(text: "5")})
                    Button(action: {typeNumb(6)}, label: {BNView(text: "8")})
                    Button(action: {operation(.minus)}, label:
                            {BOpView(image: Image(systemName: "minus"), color: Color(myC3))})
                }
                HStack {
                    Button(action: {typeNumb(1)}, label: {BNView(text: "1")})
                    Button(action: {typeNumb(2)}, label: {BNView(text: "2")})
                    Button(action: {typeNumb(3)}, label: {BNView(text: "3")})
                    Button(action: {operation(.plus)}, label:
                            {BOpView(image: Image(systemName: "plus"), color: Color(myC3))})
                }
                HStack {
                    Button(action: {typeNumb(0)}, label: {BigBView(text: "0", color: Color(myC1))})
                    Button(action: {calculateIt()}, label:
                            {BigBView(text: "=", color: Color(myC2))})
                }
            } .font(.largeTitle)
              .padding(20)
            
        }
    }
    

    func textOnDisp() {
        let number = display ?? firstValue ?? 0
        displayText = String(format: "%g", number)
    }
    
    func typeNumb(_ number: Double) {
        if  let currentNumb = display {
            display = (currentNumb * 10) + number}
        else {display = number}
    }
    func operation (_ operation: Operation){
        guard display != nil, firstValue == nil else {
            return
        }
        firstValue = display
        setOperation = operation
        display = nil
    }
    func calculateIt () {
        guard let firstV = firstValue,
              let secondV = display,
              let setOp = setOperation
        else {return}
        switch setOp {
        case .multiply: display = firstV * secondV
        case .division: if secondV != 0 {display = firstV / secondV}
            else {display = 0}
        case .minus: display = firstV - secondV
        case .plus: display = firstV +  secondV
        }
        firstValue = nil
        setOperation = nil
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {ContentView()}
    }
    
    

