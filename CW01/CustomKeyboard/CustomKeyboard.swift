//
//  CustomKeyboard.swift
//  CW01
//
//  Created by user188409 on 3/7/21.
//

import UIKit

class CustomKeyboard: UIView {

    var activeTextField = UITextField()
        
        let nibName = "CustomKeyboard"
        var contentView:UIView?
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            
            guard let view = loadViewFromNib() else { return }
            view.frame = self.bounds
            self.addSubview(view)
            contentView = view
        }
        
        func loadViewFromNib() -> UIView? {
            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: nibName, bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as? UIView
        }
    @IBAction func HandleButtonPress(_ sender: Any) {
    }
    

}
