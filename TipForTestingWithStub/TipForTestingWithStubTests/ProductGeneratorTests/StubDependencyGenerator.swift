@testable import TipForTestingWithStub

final class StubDependencyGenerator: DependencyGenerating {
    var name: String = ""
    func generate(option1: Bool, option2: Bool, option3: Bool) -> Dependency {
        Dependency(name: "\(name)\(option1)\(option2)\(option3)")
    }
}
