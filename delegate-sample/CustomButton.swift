import Foundation
import UIKit


@objc protocol CustomButtonDelegate: AnyObject {
    @objc optional func buttonDidPressed(_ button: CustomButton)
}

class CustomButton: UIButton {
    weak var delegate: CustomButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Click", for: .normal)
        self.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)
        
        self.backgroundColor = .black
        self.layer.cornerRadius = 5
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has niot been implemented")
    }
    
    @objc private func buttonDidPressed() {
        delegate?.buttonDidPressed?(self)
    }
}
