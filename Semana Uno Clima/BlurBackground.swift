//
//  BlurBackground.swift
//  Semana Uno Clima
//
//  Created by Abner Castro on 18/01/23.
//

import UIKit

class BlurBackground: UIVisualEffectView {
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 24)
        label.textColor = .black
        label.text = "Ciudad de México"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hoursStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var tempStacks: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var generalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hoursStack, tempStacks])
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        clipsToBounds = true
        
        contentView.addSubview(cityLabel)
        contentView.addSubview(generalStack)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            generalStack.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 24),
            generalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            generalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            generalStack.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureHistory(_ history: [(String, String)]) {
        history.forEach { hora, temperatura in
            hoursStack.addArrangedSubview(createLabel(text: hora))
            tempStacks.addArrangedSubview(createLabel(text: temperatura))
        }
    }
    
    // MARK: - Funciones privadas
    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.textColor = .black
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createStack(withViews array: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: array)
        stackView.axis = axis
        stackView.distribution = .equalCentering
        return stackView
    }
}
