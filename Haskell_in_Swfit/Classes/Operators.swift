//
//  Operators.swift
//  Haskell_in_Swfit
//
//  Created by Sylvanas on 07/03/2018.
//

precedencegroup LeftApplyPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup FunctionCompositionPrecedence {
    associativity: right
    higherThan: LeftApplyPrecedence
}

infix operator |> : LeftApplyPrecedence

infix operator >>> : FunctionCompositionPrecedence
