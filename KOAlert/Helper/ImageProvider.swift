//
//  ImageProvider.swift
//  KOAlert
//
//  Created by Kaan Ozdemir on 26.09.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit

public class ImageProvider {
    // convenient for specific image
    public static func picture(imageName: String) -> UIImage {
        return UIImage(named: imageName, in: Bundle(for: self), with: nil) ?? UIImage()
    }

    // for any image located in bundle where this class has built
    public static func image(named: String) -> UIImage? {
        return UIImage(named: named, in: Bundle(for: self), with: nil)
    }
}
