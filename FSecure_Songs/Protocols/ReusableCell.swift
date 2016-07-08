//
//  ReusableCell.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/6/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import UIKit

//Protocols for UITableViewCell. reuseIdentifier is name of cell class. Avoid using raw string.
protocol ReusableCell {
    var reuseIdentifier: String? { get }
}

extension ReusableCell where Self: UITableViewCell {
    var reuseIdentifier: String? {
        return Self.className
    }
}

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, index: Int) -> T {
        return dequeueReusableCell(type, indexPath: NSIndexPath(forRow: index, inSection: 0))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, indexPath: NSIndexPath) -> T {
        return dequeueReusableCellWithIdentifier(T.className, forIndexPath: indexPath) as? T ?? T()
    }
    
}


extension NSObject {
    /// Returns the className for the class
    static var className: String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last ?? NSStringFromClass(self)
    }
}