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
        
        return picker
    }()
    
    public let toCurrency: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    public let convertBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Colors.primaryColor
        btn.layer.cornerRadius = 10
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Convert", for: .normal)
        btn.setTitle("Pressed...", for: .highlighted)
        btn.clipsToBounds = true
        btn.isHighlighted = false
        return btn
    }()
    
    private let fromLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Convert from:"

        lbl.backgroundColor = .clear
        return lbl
    }()
    
    private let toLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "To:"
        lbl.backgroundColor = .clear
        return lbl
    }()
    
    public let resultLbl: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        return lbl
    }()
    
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
        stack.addArrangedSubview(amountTextField)
        stack.addArrangedSubview(fromLbl)
        stack.addArrangedSubview(fromCurrency)
        stack.addArrangedSubview(toLbl)
        stack.addArrangedSubview(toCurrency)
        stack.addArrangedSubview(convertBtn)
        stack.addArrangedSubview(resultLbl)
    }
    
    func setConstraints() {
        stack.pin
            .width(95%)
            .height(50%)
            .top(100)
            .hCenter()
    }
}

