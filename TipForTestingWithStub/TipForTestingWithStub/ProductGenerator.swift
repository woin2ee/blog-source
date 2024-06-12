public protocol ProductGenerating {
    func generate() -> Product
}

final class ProductGenerator: ProductGenerating {
    
    let dependencyGenerators: [DependencyGenerating]
    
    init(dependencyGenerators: [DependencyGenerating]) {
        self.dependencyGenerators = dependencyGenerators
    }
    
    func generate() -> Product {
        let option1 = true
        let option2 = true
        let option3 = false
        var productName: String = ""
        
        dependencyGenerators.forEach { dependencyGenerator in
            let dependency = dependencyGenerator.generate(
                option1: option1,
                option2: option2,
                option3: option3
            )
            productName += "\(dependency.name)."
        }
        
        return Product(name: productName)
    }
}
