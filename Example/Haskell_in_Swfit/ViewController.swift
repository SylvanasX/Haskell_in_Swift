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

struct Food {
    var name: String
}

struct Location {
    var name: String
}

struct User {
    var favoriteFoods: [Food]
    var location: Location
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
//        test3Btn()
//        let f = curry(String.init(data:encoding:))
        testKeyPath()
    }
    
    
    func testKeyPath() {
        let user = User(
            favoriteFoods: [
                Food(name: "Tacos"),
                Food(name: "Nachos")
            ],
            location: Location(name: "Brooklyn"),
            name: "Blob"
        )
        
        let u1 = user
            |> (prop(\User.name)) { _ in "u1"}
            |> (prop(\User.location.name)) { _ in "TestLocation" }
//        print(u1) // u1
        
        let u2 = (42, user)
            |> first(incr)
            <> (second <<< prop(\User.name)) { _ in "u2" }
            <> (second <<< prop(\User.favoriteFoods) <<< map <<< prop(\Food.name)) { $0 + "!" }
            <> (second <<< prop(\User.location.name)) { _ in "test l" }
        print(u2)
    }
    
    func testMF() {
        let x = Array(1...10)
            |> map(incr)
            >>> filter({ $0 > 6 })
        print(x)
        
        let z = 1 |> incr
                    <> sq
                    <> incr
        print(z)
    }
    
    func unboundMethods() {
        let x = String.uppercased(with:)
        let y = Locale(identifier: "en") |> flip(x)
        let z = "zzz" |> y
       
        let a = flip(String.uppercased) |> zurry
        
        
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
        let utf8String = String.Encoding.utf8 |> flip(curry(String.init(data:encoding:)))
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

func greet(at date: Date, name: String) -> String {
    let seconds = Int(date.timeIntervalSince1970) % 60
    return "Hello \(seconds) \(name)"
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




