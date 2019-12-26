//
//  HardnessModel.swift
//  EggTimer
//
//  Created by Emanuel Leal Vila on 26/12/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

enum Hardness {
    case Soft
    case Medium
    case Hard
    
    func time() -> Int {
        switch self {
            case .Soft: return 5
            case .Medium: return 7
            case .Hard: return 12
        }
    }
}

extension String {
    
    func toHardness() -> Hardness {
        switch self {
        case "Soft":
            return Hardness.Soft
        case "Medium":
            return Hardness.Medium
        case "Hard":
            return Hardness.Hard
        default:
            fatalError("You shouldn't be here.")
        }
    }
}
