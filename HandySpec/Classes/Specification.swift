//
//  Specification.swift
//
//  Copyright © 2020 Ahmad Fayyas
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

// MARK: - Abstraction

public protocol Specification {
    func isSatisfied(by candidate: Any) -> Bool
}

extension Specification {
    public func and(_ other: Specification) -> Specification {
        AndSpecification(leftCondition: self, rightCondition: other)
    }
    
    public func or(_ other: Specification) -> Specification {
        OrSpecification(leftCondition: self, rightCondition: other)
    }
    
    public func not() -> Specification {
        NotSpecification(condition: self)
    }
    
    public func andNot(_ other: Specification) -> Specification {
        AndNotSpecification(leftCondition: self, rightCondition: other)
    }
    
    public func orNot(_ other: Specification) -> Specification {
        OrNotSpecification(leftCondition: self, rightCondition: other)
    }
}

private protocol InfixSpecification: Specification {
    var leftCondition: Specification { get }
    var rightCondition: Specification { get }
}

// MARK: - Composite Specifications

private struct AndSpecification: InfixSpecification {
    let leftCondition: Specification
    let rightCondition: Specification
    
    func isSatisfied(by candidate: Any) -> Bool {
        leftCondition.isSatisfied(by: candidate) && rightCondition.isSatisfied(by: candidate)
    }
}

private struct OrSpecification: InfixSpecification {
    let leftCondition: Specification
    let rightCondition: Specification
    
    func isSatisfied(by candidate: Any) -> Bool {
        leftCondition.isSatisfied(by: candidate) || rightCondition.isSatisfied(by: candidate)
    }
}

private struct NotSpecification: Specification {
    let condition: Specification
    
    func isSatisfied(by candidate: Any) -> Bool {
        !condition.isSatisfied(by: candidate)
    }
}

private struct AndNotSpecification: InfixSpecification {
    let leftCondition: Specification
    let rightCondition: Specification
    
    func isSatisfied(by candidate: Any) -> Bool {
        leftCondition.isSatisfied(by: candidate) && !rightCondition.isSatisfied(by: candidate)
    }
}

private struct OrNotSpecification: InfixSpecification {
    let leftCondition: Specification
    let rightCondition: Specification
    
    func isSatisfied(by candidate: Any) -> Bool {
        leftCondition.isSatisfied(by: candidate) || !rightCondition.isSatisfied(by: candidate)
    }
}
