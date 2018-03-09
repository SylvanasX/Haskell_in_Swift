//
//  Function.swift
//  Haskell_in_Swfit
//
//  Created by Sylvanas on 07/03/2018.
//

public func |> <A, B> (a: A, f: (A) -> B) -> B {
    return f(a)
}

public func |> <A> (a: inout A, f: (inout A) -> Void) {
    f(&a)
}

public func >>> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A) -> C) {
    return { a in
        g(f(a))
    }
}

public func >=> <A, B, C> (
    _ f: @escaping (A) -> (B, [String]),
    _ g: @escaping (B) -> (C, [String])
    ) -> (A) -> (C, [String]) {
    return { a in
        let b = f(a)
        let c = g(b.0)
        return (c.0, b.1 + c.1)
    }
}

public func <> <A> (
    _ f: @escaping (inout A) -> Void,
    _ g: @escaping (inout A) -> Void
    ) -> (inout A) -> Void {
    return { a in
        f(&a)
        g(&a)
    }
}

public func <> <A: AnyObject> (
    _ f: @escaping (A) -> Void,
    _ g: @escaping (A) -> Void
    ) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}
