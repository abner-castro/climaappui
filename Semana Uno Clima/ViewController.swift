//
//  ViewController.swift
//  Semana Uno Clima
//
//  Created by Abner Castro on 18/01/23.
//

import UIKit

class ViewController: UIViewController {
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "mild")
        return imageView
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 30)
        label.text = "Clima frío"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-bold", size: 40)
        label.text = "-7º C"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let blurView: BlurBackground = BlurBackground(effect: UIBlurEffect(style: .light))
    
    let todayButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-bold", size: 14)
        button.setTitle("Hoy    📈", for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let viewModel: WeatherViewModel
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
        tempLabel.text = "\(viewModel.temperatura)º C"
        blurView.cityLabel.text = viewModel.city
        blurView.configureHistory(viewModel.history)
        imageView.image = UIImage(named: viewModel.imageType.rawValue)
        descLabel.text = viewModel.description
    }
    
    
    
    
    
    private func buildView() {
        view.addSubview(imageView)
        view.addSubview(descLabel)
        view.addSubview(tempLabel)
        view.addSubview(blurView)
        view.addSubview(todayButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            descLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            tempLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor,constant: 12),
            tempLabel.leadingAnchor.constraint(equalTo: descLabel.leadingAnchor),
            
            blurView.heightAnchor.constraint(equalToConstant: 200),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -128),
            
            todayButton.heightAnchor.constraint(equalToConstant: 34),
            todayButton.widthAnchor.constraint(equalToConstant: 125),
            todayButton.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
            todayButton.bottomAnchor.constraint(equalTo: blurView.topAnchor, constant: -16)
        ])
    }


}

