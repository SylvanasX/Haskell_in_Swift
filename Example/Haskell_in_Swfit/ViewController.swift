//
//  ViewController.swift
//  Haskell_in_Swfit
//
//  Created by SylvanasX on 02/17/2018.
//  Copyright (c) 2018 SylvanasX. All rights reserved.
//

import UIKit
import Haskell_in_Swfit

struct Person {
    var age: Int
    var name: String
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testCurry()
        
        testOperators()
        
        testCompute()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testOperators() {
        let r1 = 2 |> incr >>> sq >>> String.init
        print(r1)
    }
    
    func testCurry() {
        let p = curry(Person.init)(11)("mike")
        print(p.age)
        print(p.name)
    }

    func testCompute() {
        let x = 1 |> incr >>> computeAndPrint >=> computeAndPrint
        print(x)
    }
}

func incr(_ a: Int) -> Int {
    return a + 1
}

func sq(_ a: Int) -> Int {
    return a * a
}

func computeAndPrint(_ a: Int) -> (Int, [String]) {
    let x = a + 1
    let s = "compute \(x)"
    return (x, [s])
}

func testBtn() {
    var btn = UIButton()
    btn |> setBtnBGColor <> setBtnTitle
}

func setBtnBGColor(_ b: inout UIButton) {
    b.backgroundColor = .red
}

func setBtnTitle(_ b: inout UIButton) {
    b.setTitle("123", for: .normal)
}




