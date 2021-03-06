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
    higherThan: LeftApplyPrecedence, EffectfulComposition
}

precedencegroup EffectfulComposition {
    associativity: left
    higherThan: LeftApplyPrecedence
}

precedencegroup SingleTypeComposition {
    associativity: left
    higherThan: LeftApplyPrecedence
}

precedencegroup BackwarksComposition {
    associativity: right
}

infix operator |> : LeftApplyPrecedence

infix operator >>> : FunctionCompositionPrecedence

infix operator >=> : EffectfulComposition

infix operator <> : SingleTypeComposition

infix operator <<< : BackwarksComposition
