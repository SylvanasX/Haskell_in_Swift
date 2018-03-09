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

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        testCurry()
//
//        testOperators()
//
//        testCompute()
        test3Btn()
    }
    
    func test3Btn() {
        btn |>
            baseButtonStyle
            <> filledButtonStyle
            <> {
                $0.backgroundColor = .red
            }
            <> borderStyle(color: .blue, width: 2.0)
        
    }
    
    func testMap() {
        let x = [1, 2, 3].map(incr >>> sq)
        print(x)
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
        let x = 3 |> incr >>> computeAndPrint >=> computeAndPrint
        print(x)
    }
}


func borderStyle(color: UIColor, width: CGFloat) -> (UIView) -> Void {
    return {
        $0.layer.borderColor = color.cgColor
        $0.layer.borderWidth = width
    }
}


func baseButtonStyle(_ button: UIButton) {
    button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
}

func filledButtonStyle(_ button: UIButton)  {
    button.backgroundColor = .black
    button.tintColor = .white
}

func roundedButtonStyle(_ button: UIButton)  {
    button.clipsToBounds = true
    button.layer.cornerRadius = 6
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




