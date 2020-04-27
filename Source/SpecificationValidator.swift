//
//  SpecificationValidator.swift
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

public struct SpecificationValidator {
    
    // MARK: - Constants
    
    public let specificationDescriptors: [SpecificationDescriptor]
    public let candiate: Any
    
    // MARK: - Initializers
    
    public init(descriptors: SpecificationDescriptor..., candiate: Any) {
        self.specificationDescriptors = descriptors
        self.candiate = candiate
    }
    
    // MARK: - Evaluation Methods
    
    private func areSpecifications(satisfied: Bool) -> Bool {
        specificationDescriptors
            .map { $0.specification }
            .lazy
            .allSatisfy { satisfied ? $0.isSatisfied(by: candiate) : !$0.isSatisfied(by: candiate) }
    }
    
    public func areSpecificationsSatisfied() -> Bool {
        areSpecifications(satisfied: true)
    }
    
    public func areSpecificationsUnsatisfied() -> Bool {
        areSpecifications(satisfied: false)
    }
    
    // MARK: - Unsatisfaction Methods
    
    /// shall we use lazy version for performance?
    public func unsatisfiedSpecifications() -> [Specification] {
        specificationDescriptors
            .filter { !$0.specification.isSatisfied(by: candiate) }
            .map { $0.specification }
    }
    
    /// shall we use lazy version for performance?
    public func unsatisfiedSpecificationDescriptions() -> [String] {
        specificationDescriptors
            .filter { !$0.specification.isSatisfied(by: candiate) }
            .map { $0.mismatchingDescription }
    }
    
    public func firstunsatisfiedSpecification() -> Specification? {
        specificationDescriptors.first { !$0.specification.isSatisfied(by: candiate) }?.specification
    }
    
    public func firstUnsatisfiedSpecificationDescription() -> String? {
        specificationDescriptors.first { !$0.specification.isSatisfied(by: candiate) }?.mismatchingDescription
    }
}
