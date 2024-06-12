@testable import TipForTestingWithStub
import XCTest

final class ProductGeneratorTests: XCTestCase {

    var subject: ProductGenerator!
    var dependencyGenerator1: StubDependencyGenerator!
    var dependencyGenerator2: StubDependencyGenerator!
    
    override func setUp() {
        super.setUp()
        dependencyGenerator1 = StubDependencyGenerator()
        dependencyGenerator2 = StubDependencyGenerator()
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
        // When
        let product = subject.generate()
        
        // Then
        XCTAssertEqual(product.name, "truetruefalse.truetruefalse.")
    }
}
