//
//  StyleableView.swift
//  StyleableUI
//
//  Created by Denys Danyliuk on 19.02.2021.
//

import UIKit

public protocol StyleableView { }

extension UIView: StyleableView { }

// MARK: - Typealiases

public typealias Style<T> = (T) -> Void
public typealias StyleGet<T, V> = (T) -> V

// MARK: - Apply

// Applying style without return
public extension StyleableView {
    
    func apply(style: Style<Self>) {
        style(self)
    }
    
    func apply(styles: Style<Self>...) {
        styles.forEach { apply(style: $0) }
    }
    
    func apply(styles: [Style<Self>]) {
        styles.forEach { apply(style: $0) }
    }
}

// MARK: - Style

// Applying style and return self
public extension StyleableView {
    
    func style(_ style: Style<Self>) -> Self {
        apply(style: style)
        return self
    }
    
    func style(using styles: Style<Self>...) -> Self {
        apply(styles: styles)
        return self
    }
    
    func style(using styles: [Style<Self>]) -> Self {
        apply(styles: styles)
        return self
    }
}

// MARK: - StyleGet

// Applying style and return applyed propertie
public extension StyleableView {
    
    @discardableResult
    func apply<V>(style: StyleGet<Self, V>) -> V {
        return style(self)
    }
}

// MARK: - StyleableView + Array

public extension Array where Element == UIView {
    
    func apply(style: Style<Element>) {
        forEach { $0.apply(style: style) }
    }
    
    func apply(styles: Style<Element>...) {
        forEach { $0.apply(styles: styles) }
    }
    
    func apply(styles: [Style<Element>]) {
        forEach { $0.apply(styles: styles) }
    }
}

// MARK: - Predifined styles

public typealias SView = Styles.UIView
public typealias SButton = Styles.UIButton
public typealias SLabel = Styles.UILabel
public typealias STextField = Styles.UITextField
public typealias STextView = Styles.UITextView

public struct Styles {
    
    public struct UIView { }
    
    public struct UIButton { }
    
    public struct UILabel { }
    
    public struct UITextField { }
    
    public struct UITextView { }
}
