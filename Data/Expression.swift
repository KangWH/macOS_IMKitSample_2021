//
//  Expression.swift
//  IMKitSample
//
//  Created by 강우현 on 11/30/25.
//

import Foundation

typealias Enviornment = [String: Int64]

indirect enum Expression {
    case constant(_ value: Int64)
    
    case arithmeticNegation(_ value: Expression)
    case arithmeticAdd(_ lhs: Expression, _ rhs: Expression)
    case arithmeticSub(_ lhs: Expression, _ rhs: Expression)
    case arithmeticMul(_ lhs: Expression, _ rhs: Expression)
    case arithmeticDiv(_ lhs: Expression, _ rhs: Expression)
    case arithmeticMod(_ lhs: Expression, _ rhs: Expression)
    
    case comparisonEqual(_ lhs: Expression, _ rhs: Expression)
    case comparisonNotEqual(_ lhs: Expression, _ rhs: Expression)
    case comparisonLessThan(_ lhs: Expression, _ rhs: Expression)
    case comparisonLessThanOrEqual(_ lhs: Expression, _ rhs: Expression)
    case comparisonGreaterThan(_ lhs: Expression, _ rhs: Expression)
    case comparisonGreaterThanOrEqual(_ lhs: Expression, _ rhs: Expression)
    
    case bitShiftLeft(_ lhs: Expression, _ rhs: Expression)
    case bitShiftRight(_ lhs: Expression, _ rhs: Expression)
    
    case bitwiseNot(_ value: Expression)
    case bitwiseAnd(_ lhs: Expression, _ rhs: Expression)
    case bitwiseOr(_ lhs: Expression, _ rhs: Expression)
    case bitwiseXor(_ lhs: Expression, _ rhs: Expression)
    
    case logicalNegation(_ value: Expression)
    case logicalAnd(_ lhs: Expression, _ rhs: Expression)
    case logicalOr(_ lhs: Expression, _ rhs: Expression)
    
    case value(_ name: String)
    case assign(_ name: String, _ value: Expression)
    
    case sequence(_ lhs: Expression, _ rhs: Expression)
    
    case conditional(condition: Expression, onTrue: Expression, onFalse: Expression)
    
    // 아직 복합대입, 단항대입 안 만듦
    
    
    func eval(env: inout Enviornment) -> Int64 {
        switch self {
        case .constant(let value): return value
            
        case .arithmeticNegation(let value): return -value.eval(env: &env)
        case .arithmeticAdd(let lhs, let rhs): return lhs.eval(env: &env) + rhs.eval(env: &env)
        case .arithmeticSub(let lhs, let rhs): return lhs.eval(env: &env) - rhs.eval(env: &env)
        case .arithmeticMul(let lhs, let rhs): return lhs.eval(env: &env) * rhs.eval(env: &env)
        case .arithmeticDiv(let lhs, let rhs): return lhs.eval(env: &env) / rhs.eval(env: &env)
        case .arithmeticMod(let lhs, let rhs): return lhs.eval(env: &env) % rhs.eval(env: &env)
            
        case .comparisonEqual(let lhs, let rhs): return lhs.eval(env: &env) == rhs.eval(env: &env) ? 1 : 0
        case .comparisonNotEqual(let lhs, let rhs): return lhs.eval(env: &env) != rhs.eval(env: &env) ? 1 : 0
        case .comparisonLessThan(let lhs, let rhs): return lhs.eval(env: &env) < rhs.eval(env: &env) ? 1 : 0
        case .comparisonLessThanOrEqual(let lhs, let rhs): return lhs.eval(env: &env) <= rhs.eval(env: &env) ? 1 : 0
        case .comparisonGreaterThan(let lhs, let rhs): return lhs.eval(env: &env) > rhs.eval(env: &env) ? 1 : 0
        case .comparisonGreaterThanOrEqual(let lhs, let rhs): return lhs.eval(env: &env) >= rhs.eval(env: &env) ? 1 : 0
            
        case .bitShiftLeft(let lhs, let rhs): return Int64(UInt64(lhs.eval(env: &env)) << UInt64(rhs.eval(env: &env)))
        case .bitShiftRight(let lhs, let rhs): return Int64(UInt64(lhs.eval(env: &env)) >> UInt64(rhs.eval(env: &env)))
            
        case .bitwiseNot(let value): return ~value.eval(env: &env)
        case .bitwiseAnd(let lhs, let rhs): return lhs.eval(env: &env) & rhs.eval(env: &env)
        case .bitwiseOr(let lhs, let rhs): return lhs.eval(env: &env) | rhs.eval(env: &env)
        case .bitwiseXor(let lhs, let rhs): return lhs.eval(env: &env) ^ rhs.eval(env: &env)
            
        case .logicalNegation(let value): return value.eval(env: &env) == 0 ? 1 : 0
        case .logicalAnd(let lhs, let rhs): return lhs.eval(env: &env) != 0 && rhs.eval(env: &env) != 0 ? 1 : 0
        case .logicalOr(let lhs, let rhs): return lhs.eval(env: &env) != 0 || rhs.eval(env: &env) != 0 ? 1 : 0
            
        case .value(let name): return env[name] ?? 0
        case .assign(let name, let value):
            let evaluatedValue = value.eval(env: &env)
            env[name] = evaluatedValue
            return evaluatedValue
            
        case .sequence(let lhs, let rhs):
            let _ = lhs.eval(env: &env)
            return rhs.eval(env: &env)
            
        case .conditional(condition: let condition, onTrue: let onTrue, onFalse: let onFalse):
            let evaluatedCondition = condition.eval(env: &env)
            if evaluatedCondition != 0 {
                return onTrue.eval(env: &env)
            } else {
                return onFalse.eval(env: &env)
            }
            
//        default: break
        }
    }
}


struct CharacterExpression {
    var expression: Expression
    
    func getValue(environment: Enviornment) -> Int64 {
        var env = environment
        return expression.eval(env: &env)
    }
}

struct AutomataExpression {
    var expression: Expression
    
    func getValue(environment: Enviornment) -> Int64 {
        var env = environment
        return expression.eval(env: &env)
    }
}
