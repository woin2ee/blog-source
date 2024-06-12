public protocol DependencyGenerating {
    func generate(option1: Bool, option2: Bool, option3: Bool) -> Dependency
}

final class FooDependencyGenerator: DependencyGenerating {
    func generate(option1: Bool, option2: Bool, option3: Bool) -> Dependency {
        // Make dependency using something own way.
        return Dependency(name: "\(option1)\(option2)\(option3)")
    }
}

final class BarDependencyGenerator: DependencyGenerating {
    func generate(option1: Bool, option2: Bool, option3: Bool) -> Dependency {
        // Make dependency using something own way.
        return Dependency(name: "\(option1)-\(option2)-\(option3)")
    }
}
