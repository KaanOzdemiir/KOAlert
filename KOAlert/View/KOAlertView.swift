//
//  KOAlertView.swift
//  KOAlert
//
//  Created by Kaan Ozdemir on 12.09.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit

class KOAlertView: UIView {
    
    var alertView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addAlertView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addAlertView()
    }
    
    func addAlertView() {
        self.addSubview(alertView)
        alertView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        alertView.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, constant: self.frame.height * 0.8).isActive = true
        alertView.widthAnchor.constraint(equalToConstant: self.frame.width * 0.7).isActive = true
    }
    
    func addImageView() {
        let imageView = createImageView(image: nil)
        alertView.addSubview(imageView)
    }
    
    func createImageView(image: UIImage?) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = 32
        imageView.layer.masksToBounds = true
        imageView.image = image
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return imageView
    }
}
