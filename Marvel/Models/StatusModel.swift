//
//  StatusModel.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import Foundation

import Foundation

//Mis estados de la navegacion Principal
enum Status {
    case none, loading, loaded, register, error(error: String)
}
