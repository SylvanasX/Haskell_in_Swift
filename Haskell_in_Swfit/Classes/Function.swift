//
//  Function.swift
//  Haskell_in_Swfit
//
//  Created by Sylvanas on 07/03/2018.
//

public func |> <A, B> (a: A, f: (A) -> B) -> B {
    return f(a)
}

public func >>> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A) -> C) {
    return { a in
        g(f(a))
    }
}
