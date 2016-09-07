//
//  CalculatorBrain.swift
//  Calculataor
//
//  Created by Neil Cai on 8/27/16.
//  Copyright © 2016 Neil,Cai. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    private var accumulator = 0.0
    
    func setOPerand(operand: Double) {
        accumulator = operand
    }
    
    private var operations: Dictionary<String,opertion> = [
        
        "π" : opertion.Constant(M_PI),
        "e" : opertion.Constant(M_E),
        "√" : opertion.UnaryOperation(sqrt),
        "cos" : opertion.UnaryOperation(cos),
        "×" :opertion.BinaryOperation({ $0 * $1}),
        "÷" :opertion.BinaryOperation({ $0 / $1}),
        "+" :opertion.BinaryOperation({ $0 + $1}),
        "−" :opertion.BinaryOperation({ $0 - $1}),
        "=" : opertion.Equals
    ]
    private enum opertion {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
    }
    func performOperation(symblo: String) {
        if let opertion = operations[symblo]{
            switch opertion {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals :
                executePendingBinaryOperation()
            }
        }
        
    }
    
    private func executePendingBinaryOperation(){
        if pending  != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending = nil
        }

    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double,Double) -> Double
        var firstOperand: Double
        
    }
    
    
    var result: Double {
        get {
            return accumulator
        }
        
    }
}