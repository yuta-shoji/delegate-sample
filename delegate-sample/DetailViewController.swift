import UIKit
import SnapKit


class DetailViewController: UIViewController {
    
    var name: String?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
        feelLabel.text = "I want..."
        
        setupButton()
    }
    
    private func setupButton() {
        let button = CustomButton()
        button.delegate = self
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
    }

}

extension DetailViewController: CustomButtonDelegate {
    func buttonDidPressed(_ button: CustomButton) {
        feelLabel.text = "I want \(name!.first!)!!"
    }
}
