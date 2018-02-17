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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testCurry() {
        let p = curry(Person.init)(11)("mike")
        print(p.age)
        print(p.name)
    }

}



