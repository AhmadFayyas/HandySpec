//
//  ViewController.swift
//  HandySpec
//
//  Created by Ahmad Fayyas on 04/25/2020.
//  Copyright (c) 2020 Ahmad Fayyas. All rights reserved.
//

import UIKit
import HandySpec

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func perform() {
        let emailRegex = RegexSpecification(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let phoneRegex = RegexSpecification(pattern: "^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]\\d{3}[\\s.-]\\d{4}$")

        let result = emailRegex.or(phoneRegex)

        emailRegex == "ahmed.almasri@ymail.com"
        result == "ahmed.almasri@ymail.com"
        result == "ahmed.almasri"
        result == "123-456-7890"
        result == "123-456-7894"
        result == true


        let counter1 = CountSpec(input: 20)
        let counter2 = CountSpec(input: 40)

        let edescriptor = SpecificationDescriptor(specification: emailRegex)
        let pdescreptor = SpecificationDescriptor(specification: phoneRegex, mismatchingDescription: "not phone")

        let validator = SpecificationValidator(descriptors: edescriptor, pdescreptor, candiate: "asdasd")
    }

}


struct RegexSpecification: Specification {
    func isSatisfied(by candidate: Any) -> Bool {
        guard let value = candidate as? String else { return false }
        return regex.numberOfMatches(in: value, options: [],
                                     range: NSMakeRange(0, value.count)) > 0
    }
    
    let regex: NSRegularExpression
    init(pattern: String) {
        self.regex = try! NSRegularExpression(pattern: pattern, options: [])
    }
}

struct CountSpec: Specification {
    let input: Int
    
    func isSatisfied(by candidate: Any) -> Bool {
        let ca = candidate as! String
        return ca.count > input
    }
}
