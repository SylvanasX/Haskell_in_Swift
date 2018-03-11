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
    _ f: @escaping (A) -> A,
    _ g: @escaping (A) -> A
    ) -> (A) -> A {
    return f >>> g
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

public func flip <A, B, C> (
    _ f: @escaping (A) -> (B) -> (C)
    ) -> (B) -> (A) -> C {
    return { b in { a in f(a)(b) } }
}

public func flip <A, C> (
    _ f: @escaping (A) -> () -> C
    ) -> () -> (A) -> C {
    return { { a in f(a)() } }
}

public func zurry <A> (
    _ f: () -> A
    ) -> A {
    return f()
}

public func map <A, B> (_ f: @escaping (A) -> B) -> ([A]) -> [B] {
    return { $0.map(f) }
}

public func filter <A> (_ p: @escaping (A) -> Bool) -> ([A]) -> [A] {
    return { $0.filter(p) }
}
