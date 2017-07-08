//
//  model_class.swift
//  Calc
//
//  Created by Евгений on 27.06.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import Foundation


func changeSign (_ value : Double) -> Double {

return -value
}


func multiply (_ v1:Double,_ v2 : Double) ->Double
    {return v1*v2}




struct Brain

{
    
    private struct PendingBinaryOperation
        
    {
        
        let function: (Double,Double) -> Double
        let firstoperand  : Double
        
    }
    
    private var pbo : PendingBinaryOperation?
    
    
    private enum Operation {
    
        case constant(Double)
        case unaryOperations((Double) -> Double)
        case Binary ((Double,Double)->Double)
        case equals
        case dot
    
    }
 
    
    private var operations: Dictionary <String,Operation> =
    
        [
            "pi": Operation.constant(Double.pi),
            "e" : Operation.constant(M_E),
            "S": Operation.unaryOperations(sqrt),
            "sign": Operation.unaryOperations(changeSign),
            "=": Operation.equals,
            "+": Operation.Binary({$0+$1}),
            "*":Operation.Binary({$0*$1}),
            "-":Operation.Binary({$0-$1}),
            "/":Operation.Binary({$0/$1}),
            ".":Operation.dot
    
    
    
    ]
 private var accumulator: Double?
    
   mutating func executeBinaryOperation()
    {
        if pbo != nil{
            accumulator = pbo!.function(pbo!.firstoperand,accumulator!)
            pbo = nil
            
        }
    }
    
  mutating func performOperation (_ symbol : String) {
    
    
if let operation = operations[symbol]{
    
    switch operation {
    case .constant(let assotiatedValue):
        accumulator = assotiatedValue
        
    case .unaryOperations(let function) :
        
        if (accumulator != nil)
        {
            accumulator = function(accumulator!)
        }
        
        break
        
    case .Binary(let function):
        executeBinaryOperation()
        pbo = PendingBinaryOperation(function: function, firstoperand : accumulator!)
        
    case .equals:
      executeBinaryOperation()
        
        
    default:
        break
    }
    
    
    }
    
    }
    
 
    
 mutating func setOperand(_ operand : Double) {
        accumulator = operand
    
    }
    
    var result : Double?
    {
        get {
            return accumulator
        }
        set {
        result = newValue
        }
        
        
    }


}


