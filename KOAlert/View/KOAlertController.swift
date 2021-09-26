//
//  KOAlertController.swift
//  KOAlert
//
//  Created by Kaan Ozdemir on 12.09.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit

public class KOAlertController: UIViewController {
    
    @IBOutlet var overlayView: UIView!
    
    // MARK: - Enums
    public enum Style {
        case alert
        case actionSheet
    }
    
    public enum AlertType: Hashable {
        case info
        case error
        case warning
        case success
        case custom(image: UIImage?)
    }
    
    // MARK: - Variables
    var _title: String?
    var _message: String?
    var _preferredStyle: Style = .alert
    lazy var _actions: [KOAlertAction] = []
    var isPresenting: Bool = false
    var isPresented: Bool = false
    var alertType: AlertType = .success
    
    var alertView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 10
        v.backgroundColor = UIColor("F4EEFF")
        return v
    }()
    
    let actionStackView: UIStackView = {
        let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 8
        return s
    }()
    
    var buttonsBackgroundColor: [KOAlertAction.Style: UIColor] = [
        .default : UIColor("5454C5"),
        .destructive : UIColor("e61c5d"),
        .cancel : UIColor("DCD6F7")
    ]
    
    var buttonsTextColors: [KOAlertAction.Style: UIColor] = [
        .default : UIColor("ffffff"),
        .destructive : UIColor("ffffff"),
        .cancel : UIColor("00000")
    ]
    
    var buttonsFonts: [KOAlertAction.Style: UIFont] = [
        .default : UIFont.systemFont(ofSize: 15, weight: .medium),
        .destructive : UIFont.systemFont(ofSize: 15, weight: .medium),
        .cancel : UIFont.systemFont(ofSize: 15, weight: .semibold)
    ]
    
    var icons: [AlertType: String] = [
        .success : "ic_success",
        .error : "ic_error",
        .warning : "ic_warning",
        .info : "ic_info"
    ]
    
    public init(title: String?, message: String?, preferredStyle: Style, alertType: AlertType) {
        super.init(nibName: nil, bundle: nil)
        self._title = title
        self._message = message
        self._preferredStyle = preferredStyle
        self.alertType = alertType
        
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        addAlertView()
        
        _actions.forEach { action in
            addAction(action)
            let button = createButton(action: action)
            button.addAction(for: .touchUpInside) {
                action._handler?(action)
            }
            actionStackView.addArrangedSubview(button)
        }
    }
    
    func addButton(button: UIButton, to: UIView) {
        if let stackView = to as? UIStackView {
            stackView.addArrangedSubview(button)
        }
    }
    
    
    func createImageView() -> UIImageView {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 48
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        var _image: UIImage?
        switch alertType {
        case .custom(let image):
            _image = image
        default:
            _image = ImageProvider.image(named: icons[alertType] ?? "")
        }
        imageView.image = _image
        imageView.isHidden = imageView.image == nil
        return imageView
    }
    
    func addImageViewConstraint(imageView: UIImageView, to: UIView) {
        to.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: to.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: to.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 96).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 96).isActive = true
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.isPresented = true
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.isPresented = false
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isPresenting = true
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.isPresenting = false
    }
    
    public func addAction(_ action: KOAlertAction) {
        _actions.append(action)
    }
}

extension KOAlertController {
    func addAlertView() {
        view.addSubview(alertView)
        alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        alertView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, constant: view.frame.height * 0.8).isActive = true
        alertView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
        
        let imageView = createImageView()
        addImageViewConstraint(imageView: imageView, to: alertView)
        
        let labelStackView = createStackView()
        
        alertView.addSubview(labelStackView)
        labelStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 16).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -16).isActive = true
        
        let titleLabel = createTitleLabel()
        let messageLabel = createMessageLabel()
        
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(messageLabel)

        alertView.addSubview(actionStackView)
        actionStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 16).isActive = true
        actionStackView.widthAnchor.constraint(equalTo: labelStackView.widthAnchor).isActive = true
        actionStackView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        actionStackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -16).isActive = true
    }
    
    func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = _title
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }
    
    func createMessageLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = _message
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 2
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }
    
    func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }
    
    func createButton(action: KOAlertAction) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.setTitle(action._title, for: .normal)
        button.setTitleColor(buttonsTextColors[action._style], for: .normal)
        button.backgroundColor = buttonsBackgroundColor[action._style]
        button.titleLabel?.font = buttonsFonts[action._style]

        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }
}
