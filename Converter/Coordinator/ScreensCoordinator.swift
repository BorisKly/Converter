//
//  ScreensCoordinator.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//


import UIKit

enum AvailableScreens {
    case exchangeRates
}
final class ScreensCoordinator: Coordinator {
    // MARK: -
    // MARK: Constants
    public let navigationController: UINavigationController
    // MARK: -
    // MARK: Properties
    private var navigationScreens: [AvailableScreens] = []
    // MARK: -
    // MARK: Init and Deinit
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    public func start() {
        self.jumpToScreen(.exchangeRates)    //
    }
    // MARK: -
    // MARK: Methods

    private func loadConverterScreen() {
        let controller =
            ConverterViewController.startVC()
        self.navigationController.pushViewController(controller, animated: true)
    }
}
// MARK: -
// MARK: Extensions
extension ScreensCoordinator {
    public func jumpToScreen(_ jumpTo: AvailableScreens) {
        switch jumpTo {
        case .exchangeRates:
            self.loadConverterScreen()
        }
    }
}
