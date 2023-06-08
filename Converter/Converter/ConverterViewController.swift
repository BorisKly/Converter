//
//  ConverterViewController.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ConverterViewController: UIViewController {

    public var model: ConverterModel = ConverterModel()

    var enumPickerDelegate : EnumPickerDelegate!
    let disposeBag = DisposeBag()
 
    
    private var mainView: ConverterView? {
        return self.view as? ConverterView
    }
    
    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = ConverterView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.backgroundBase
        self.view = codeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismisKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        enumPickerDelegate = EnumPickerDelegate(values: [.chf, .eur, .gbp, .usd])
      
        mainView?.toCurrency.delegate = enumPickerDelegate
        mainView?.toCurrency.dataSource = enumPickerDelegate
        
        mainView?.fromCurrency.delegate = enumPickerDelegate
        mainView?.fromCurrency.dataSource = enumPickerDelegate

        bindView()
    }
    
    @objc func dismisKeyboard() {
        view.endEditing(true)
    }
    private func bindView() {
        
        mainView?.convertBtn.rx.tap.bind(onNext: { [weak self] _ in
            self?.model.setModel {
               print("")
            }
           // self?.mainView?.resultLbl.text = self?.model.jsonP?.result
        }).disposed(by: disposeBag)
        
        mainView?.amountTextField.rx.text
            .bind(onNext: { [weak self] text in
                self?.model.amount = String(text ?? "")
            }).disposed(by: disposeBag)
        
        mainView?.toCurrency.rx.itemSelected.bind(onNext: { [weak self] to in
            print(to.row)
            self?.model.toCurrency = to.row.description.description
        }).disposed(by: disposeBag)
       
        mainView?.fromCurrency.rx.itemSelected.bind(onNext: { [weak self] from in
            print(from.component.description)
            self?.model.toCurrency = from.row.description
        }).disposed(by: disposeBag)
        
    }
}
