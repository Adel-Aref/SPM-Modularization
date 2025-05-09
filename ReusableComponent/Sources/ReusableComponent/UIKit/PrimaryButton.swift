//
//  PrimaryButton.swift
//  ReusableComponent
//
//  Created by MAdelAref on 08/05/2025.
//

import UIKit

public struct ButtonConfiguration {
    let title: String
    let backgroundColor: UIColor
    let titleColor: UIColor
    let action: () -> Void
    
    public init(
        title: String = "Button",
        backgroundColor: UIColor = .systemBlue,
        titleColor: UIColor = .white,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.action = action
    }
}

public class PrimaryButton: UIButton {

    public init(configuration: ButtonConfiguration) {
        super.init(frame: .zero)
        
        self.setTitle(configuration.title, for: .normal)
        self.backgroundColor = configuration.backgroundColor
        self.setTitleColor(configuration.titleColor, for: .normal)
        
        if #available(iOS 14.0, *) {
            self.addAction(UIAction(handler: { _ in
                configuration.action()
            }), for: .touchUpInside)
        } else {
            // Fallback on earlier versions
        }
        
        self.layer.cornerRadius = 8
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

