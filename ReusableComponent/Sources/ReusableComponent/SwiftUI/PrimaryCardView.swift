//
//  PrimaryCardView.swift
//  Modularization
//
//  Created by MAdelAref on 08/05/2025.
//

import SwiftUI

public struct PrimaryCardView: View {
    var title: String
    var bodyContent: String
    var additionalDetails: String? = nil
    
    public init(title: String, bodyContent: String, additionalDetails: String? = nil) {
        self.title = title
        self.bodyContent = bodyContent
        self.additionalDetails = additionalDetails
    }

    @available(iOS 13.0, *)
    public var body: some View {
        if #available(iOS 15.0, *) {
            HStack(spacing: AppSpacing.sm) {
                VStack(alignment: .leading, spacing: AppSpacing.sm) {
                    Text(title)
                        .font(AppFonts.headingFont)
                        .foregroundColor(AppColors.primaryColor)
                    
                    Text(bodyContent)
                        .font(AppFonts.bodyFont)
                        .foregroundColor(AppColors.textColor)
                    
                    if let details = additionalDetails {
                        Text(details)
                            .font(AppFonts.captionFont)
                            .foregroundColor(AppColors.grayTextColor)
                    }
                }
                .padding()
                Spacer()
            }
            .background(AppColors.backgroundColor)
            .cornerRadius(10.0)
            .shadow(radius: 5)
            .padding(AppSpacing.m)
        } else {
            Text("Unsupported iOS Version")
        }
    }
}



@available(iOS 13.0, *)
// MARK: - Spacing Sizes
public struct AppSpacing {
    static let sm: CGFloat = 8
    static let m: CGFloat = 16
    static let lg: CGFloat = 24
    static let xl: CGFloat = 32
}

@available(iOS 13.0, *)
public struct AppColors {
    static let primaryColor = Color.primary
    static let secondaryColor = Color.secondary
    @available(iOS 15.0, *)
    static let backgroundColor = Color.gray
    static let textColor = Color.white
    static let grayTextColor = Color.secondary
}

@available(iOS 13.0, *)
public struct AppFonts {
    static let headingFont = Font.custom("Helvetica-Bold", size: 16)
    static let bodyFont = Font.custom("Helvetica", size: 14)
    static let captionFont = Font.custom("Helvetica", size: 12)
}
