import Foundation

extension GroupConstraint {
    
    struct AnyStrategy: Strategy {
        
        func evaluate<C: Constraint>(constraints: [C], with input: C.InputType) -> Result<Void, Summary<C.ErrorType>> {
            return constraints.reduce(.success(())) {
                switch $0 {
                case .success: return $1.evaluate(with: input)
                case .failure: return $0
                }
            }
        }
    }
}
