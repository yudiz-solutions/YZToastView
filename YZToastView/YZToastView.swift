//
//  YZToastView.swift
//  YZToastView
//
//  Created by Yudiz Solutions Ltd on 07/11/23.
//

import UIKit

class YZToastView: UIView {
    
    static let shared = YZToastView()

    private let messageLabel = UILabel()
    private let toastPadding: CGFloat = 16
    private var toastHeight: CGFloat = 0

    private init() {
        super.init(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 0))
        backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.8)
        
        messageLabel.text = ""
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0

        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: toastPadding).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -toastPadding).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -toastPadding).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func hide() {
        UIView.animate(withDuration: 0.5, animations: {
            self.frame.origin.y = -self.toastHeight
        }) { _ in
            self.removeFromSuperview()
        }
    }
}

//MARK: - Public methods
extension YZToastView {
    func show(withMessage message: String,
              inView view: UIView,
              bgColor: UIColor = .green,
              textColor: UIColor = .white) {
        messageLabel.text = message
        backgroundColor = bgColor
        messageLabel.textColor = textColor
        let labelSize = messageLabel.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 2 * toastPadding, height: .greatestFiniteMagnitude))
        toastHeight = (labelSize.height + 1 * toastPadding) + (view.window?.safeAreaInsets.top ?? 0)
        
        self.frame = CGRect(x: 0, y: -toastHeight, width: UIScreen.main.bounds.width, height: toastHeight)
        
        view.addSubview(self)
        UIView.animate(withDuration: 0.5, animations: {
            self.frame.origin.y = 0
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.hide()
            }
        }
    }
}
