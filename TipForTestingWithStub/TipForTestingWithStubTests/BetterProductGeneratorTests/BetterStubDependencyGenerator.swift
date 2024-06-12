@testable import TipForTestingWithStub

final class BetterStubDependencyGenerator: DependencyGenerating {
    var generateStub: ((Bool, Bool, Bool) -> Dependency)?
    func generate(option1: Bool, option2: Bool, option3: Bool) -> Dependency {
        return generateStub?(option1, option2, option3) ?? Dependency(name: "")
    }
}
