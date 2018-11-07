//
//  baseConverter.swift
//  NumberConverter
//
//  Created by John Carden on 6/25/18.
//  Copyright © 2018 John Carden. All rights reserved.
//

import Foundation
class baseConverter{
    
    var initialInput: String
    init( _ givenNumber: String) {
        initialInput = givenNumber
    }
    ////////////////   Error Checking logic   ///////////////////////////////////
    var octTest = ["-","0","1","2","3","4","5","6","7"]
    var hexTest = ["-","0","1","2","3","4","5","6","7","8","9","a","A","b","B","c","C","d","D","e","E","f","F"]
    var binTest = ["-","0","1"]
    func contains( _ first: [String], _ second: Substring) -> Bool{
        for element in first{
            if second == element{
                return true
            }
        }
        return false
    }
    func errorCheckerBin()->Bool{
        for i in  0..<initialInput.count{
            let element = initialInput[initialInput.index(initialInput.startIndex, offsetBy: i)..<initialInput.index(initialInput.startIndex, offsetBy: i+1)]
            if contains(binTest,element){
            }else{
                return false
            }
        }
        return true
    }
    func errorCheckerDec() -> Bool{
        if let _: Int = Int(initialInput){
            return true
        }
        return false
    }
    func errorCheckerOct() -> Bool{
        for i in  0..<initialInput.count{
            let element = initialInput[initialInput.index(initialInput.startIndex, offsetBy: i)..<initialInput.index(initialInput.startIndex, offsetBy: i+1)]
            if contains(octTest,element){
            }else{
                return false
            }
        }
        return true
    }
    func errorCheckerHex() -> Bool{
        for i in  0..<initialInput.count{
            let element = initialInput[initialInput.index(initialInput.startIndex, offsetBy: i)..<initialInput.index(initialInput.startIndex, offsetBy: i+1)]
            if contains(hexTest,element){
            }else{
                return false
            }
        }
        return true
    }
    /////////////////////////////////////////////////////////////////////////
    
    ///////////////////////   Computation logic   //////////////////////////
    func exp( _ f: Int, _ s: Int) -> Int{
        if s == 0{return 1}
        var sum = 1
        for _ in (0..<s){
            sum *= f
        }
            return sum
    }
    
    func binToDecimal() -> String{
        var current = 0
        var sum = 0
        for i in (0..<initialInput.count).reversed(){
            let element = initialInput[initialInput.index(initialInput.startIndex, offsetBy: i)..<initialInput.index(initialInput.startIndex, offsetBy: i+1)]
            if element == "1"{
                sum += exp(2,current)
                }
            current += 1
            if element == "-"{
                sum *= (-1)
            }        }
        return "\(sum)"
    }
    
    func binToOct()-> String{
        let current = Int(binToDecimal())!
        return String(current, radix:8)
    }
    
    func binToHex()-> String{
        let current = Int(binToDecimal())!
        return String(current, radix:16)
    }
    
    func octToBin() -> String{
        let current = Int(octToDecimal())!
        return String(current, radix:2)
    }
    
    func octToHex() -> String{
        let current = Int(octToDecimal())!
        return String(current, radix:16)
    }
    
    func octToDecimal() -> String{
        var current = 0
        var sum = 0
        for i in (0..<initialInput.count).reversed(){
            let element = initialInput[initialInput.index(initialInput.startIndex, offsetBy: i)..<initialInput.index(initialInput.startIndex, offsetBy: i+1)]
            sum += Int(element)! * exp(8,current)
            current += 1
            if element == "-"{
                sum *= (-1)
            }
        }
        return "\(sum)"
    }
    
    func decimalToBin()-> String{
        let b: Int = Int(initialInput)!
        return String(b, radix:2)
        }
    
    func decimalToOct()-> String{
        let b: Int = Int(initialInput)!
        return String(b, radix:8)
        }
    
    func decimalToHex()-> String{
        let b: Int = Int(initialInput)!
        return String(b, radix:16)
        }
    
    func hexToBin()-> String{
        let b: Int = Int(hexToDecimal())!
        return String(b, radix:2)    }
    
    func hexToDecimal()-> String{
        var current = 0
        var sum = 0
        for i in (0..<initialInput.count).reversed(){
            let element = initialInput[initialInput.index(initialInput.startIndex, offsetBy: i)..<initialInput.index(initialInput.startIndex, offsetBy: i+1)]
            if let _ = Int(element){
                sum += Int(element)! * exp(16,current)
            }else{
                switch element{
                case "a", "A":sum += 10 * exp(16,current)
                case "b", "B":sum += 11 * exp(16,current)
                case "c", "C":sum += 12 * exp(16,current)
                case "d", "D":sum += 13 * exp(16,current)
                case "e", "E":sum += 14 * exp(16,current)
                case "f", "F":sum += 15 * exp(16,current)
                default:var _ = "nothing"
                }
            }
            current += 1
            if element == "-"{
                sum *= (-1)
            }        }
        return "\(sum)"
    }
    
    func hexToOct()-> String{
        let b: Int = Int(hexToDecimal())!
        return String(b, radix:8)  }
}
