//
//  StyleableView.swift
//  StyleableUI
//
//  Created by Denys Danyliuk on 19.02.2021.
//

import UIKit

public protocol StyleableView { }

extension UIView: StyleableView { }

public typealias Style<T> = (T) -> Void

public extension StyleableView {
    
    // Applying style
    func apply(style: Style<Self>) {
        style(self)
    }
    
    func apply(styles: Style<Self>...) {
        styles.forEach(apply(style:))
    }
    
    func apply(styles: [Style<Self>]) {
        styles.forEach(apply(style:))
    }
    
    // Applying style and returning self
    func with(_ style: Style<Self>) -> Self {
        apply(style: style)
        return self
    }
    
    func styled(using styles: Style<Self>...) -> Self {
        apply(styles: styles)
        return self
    }
    
    func styled(using styles: [Style<Self>]) -> Self {
        apply(styles: styles)
        return self
    }
}
