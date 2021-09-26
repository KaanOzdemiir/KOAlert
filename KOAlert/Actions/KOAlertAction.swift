//
//  KOAlertAction.swift
//  KOAlert
//
//  Created by Kaan Ozdemir on 12.09.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import Foundation

public typealias AlertActionHandler = ((KOAlertAction) -> Void)?

public class KOAlertAction {
    
    public enum Style {
        case `default`
        case destructive
        case cancel
    }
    
    // MARK: - Variables
    var _title: String?
    var _style: Style = .default
    var _handler: AlertActionHandler = { _ in }
    
    public init(title: String, style: KOAlertAction.Style, handler: AlertActionHandler) {
        self._title = title
        self._style = style
        self._handler = handler
    }
}
