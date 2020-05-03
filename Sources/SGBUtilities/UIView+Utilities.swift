//
//  UIView+Utilities.swift
//  
//
//  Created by Stuart Breckenridge on 02/05/2020.
//

#if os(iOS)
import UIKit


extension UIView {
    
    /// Convenience function to load a view from a `xib`. Example: `let myCustomView: CustomView = .fromNib()`
    /// - Returns: `UIView`
    public class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
#endif
