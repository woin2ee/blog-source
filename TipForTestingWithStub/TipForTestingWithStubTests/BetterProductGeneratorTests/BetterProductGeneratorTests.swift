@testable import TipForTestingWithStub
import XCTest

final class BetterProductGeneratorTests: XCTestCase {

    var subject: ProductGenerator!
    var dependencyGenerator1: BetterStubDependencyGenerator!
    var dependencyGenerator2: BetterStubDependencyGenerator!
    
    override func setUp() {
        super.setUp()
        dependencyGenerator1 = BetterStubDependencyGenerator()
        dependencyGenerator2 = BetterStubDependencyGenerator()
        subject = ProductGenerator(
            dependencyGenerators: [
                dependencyGenerator1,
                dependencyGenerator2,
            ]
        )
    }
    
    override func tearDown() {
        subject = nil
        dependencyGenerator1 = nil
        dependencyGenerator2 = nil
        super.tearDown()
    }

    func test_generate() {
        // Given
        dependencyGenerator1.generateStub = { option1, _, _ -> Dependency in
            if option1 {
                return Dependency(name: "Option1Stub1")
            } else {
                return Dependency(name: "Stub1")
            }
        }
        dependencyGenerator2.generateStub = { _, _, _ -> Dependency in
            return Dependency(name: "JustStub2")
        }
        
        // When
        let product = subject.generate()
        
        // Then
        XCTAssertEqual(product.name, "Option1Stub1.JustStub2.")
    }
}
