//
//  Entities.swift
//  SimpleTableViewWithCell
//
//  Created by Felipe Ignacio Zapata Riffo on 20-07-21.
//

import Foundation

struct Results:Codable{
    let data:[Animals]
}

struct Animals:Codable{
    let type:String
    let image:String
    let description:[String]
}
