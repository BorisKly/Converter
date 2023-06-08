//
//  Coordinator.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//


import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
