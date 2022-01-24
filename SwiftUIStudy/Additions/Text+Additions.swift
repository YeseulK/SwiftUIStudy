//
//  Text+Additions.swift
//  SwiftUIStudy
//
//  Created by Yeseul Kim on 1/25/22.
//

import Foundation
import SwiftUI

extension Text {
    enum Kind {
        case primary
        case secondary
    }

    func style(_ kind: Kind) -> some View {
        switch kind {
        case .primary:
            return self
                .font(.headline)
                .lineLimit(1)
        case .secondary:
            return self
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }
    }
}
