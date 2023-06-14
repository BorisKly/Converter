//
//  ConverterView.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import UIKit
import PinLayout

class ConverterView: UIView {
    
    public let amountTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.layer.cornerRadius = CGFloat(10)
        text.textColor = .black
        text.textAlignment = .center
        text.clearButtonMode = .always
        text.returnKeyType = .done
        text.keyboardType = .numberPad
        text.placeholder = "Amount"
        return text
    }()
    public let fromCurrency: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = Colors.backgroundBase
        picker.layer.cornerRadius = 10
        return picker
    }()
    
    public let toCurrency: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = Colors.backgroundBase
        picker.layer.cornerRadius = 10
        return picker
    }()
    
    public let convertBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Colors.backgroundBase
        btn.layer.cornerRadius = 10
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Convert", for: .normal)
        btn.setTitle("Pressed...", for: .highlighted)
        btn.clipsToBounds = true
        btn.isHighlighted = false
        return btn
    }()
    
    private let enterAmountLbl = UILabel()
    private let fromLbl = UILabel()
    private let toLbl = UILabel()
    private let pressLbl = UILabel()
    public let resultLbl = UILabel()
        
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(stack)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addStackView()
        setConstraints()
        
    }
    
    private func addStackView() {
        stack.addArrangedSubview(enterAmountLbl)
        stack.addArrangedSubview(amountTextField)
        stack.addArrangedSubview(fromLbl)
        stack.addArrangedSubview(fromCurrency)
        stack.addArrangedSubview(toLbl)
        stack.addArrangedSubview(toCurrency)
        stack.addArrangedSubview(pressLbl)
        stack.addArrangedSubview(convertBtn)
        stack.addArrangedSubview(resultLbl)
        
        fromLbl.setUILabel(text: "Convert from:")
        enterAmountLbl.setUILabel(text: "Enter amount:")
        pressLbl.setUILabel(text: "Press to convert:")
        resultLbl.setUILabel(text: "")
        toLbl.setUILabel(text: "To:")
    }
    
    func setConstraints() {
        stack.pin
            .width(95%)
            .height(60%)
            .top(100)
            .hCenter()
    }
}

