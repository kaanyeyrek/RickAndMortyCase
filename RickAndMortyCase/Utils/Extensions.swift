//
//  Extensions.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/10/23.
//

import UIKit

private var emptyView: RMView?

// NSLayout Ex
struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}
extension UIView {
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        if let leading = leading {
            anchoredConstraints.top = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        let anchorArray = [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height]
        anchorArray.forEach({
            $0?.isActive = true
        })
        return anchoredConstraints
    }
    func fillSuperView(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        if let superViewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superViewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        if let superViewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superViewLeadingAnchor, constant: padding.left).isActive = true
        }
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    func centerInSuperView(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    func anchorSize(to view: UIView, widthMultiplier: CGFloat = 1.0, heightMultiplier: CGFloat = 1.0) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.width = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier)
        anchoredConstraints.height = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: heightMultiplier)
        let anchorArray = [anchoredConstraints.width, anchoredConstraints.height]
        anchorArray.forEach({
            $0?.isActive = true
        })
        return anchoredConstraints
    }
}
// UIColor Extension
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
// Date extension
extension String {
    func toDate(with format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
// Empty View
func showEmptyStateView(with message: String, at view: UIView) {
    DispatchQueue.main.async {
        emptyView?.removeFromSuperview()
        emptyView = RMView(message: message)
        guard let emptyView = emptyView else { return }
        let emptyViewHeight: CGFloat = 50
        let emptyViewY: CGFloat
        if view.bounds.width > view.bounds.height { // landscape mode
            emptyViewY = (view.bounds.height - emptyViewHeight) / 2 + 30
        } else { // portrait mode
            emptyViewY = (view.bounds.height - emptyViewHeight) / 2 + 30
        }
        emptyView.frame = CGRect(x: 0, y: emptyViewY, width: view.bounds.width, height: emptyViewHeight)
        view.addSubview(emptyView)
    }
}
// Remove empty view
    func removeEmptyStateView() {
        DispatchQueue.main.async {
            emptyView?.removeFromSuperview()
        }
}


