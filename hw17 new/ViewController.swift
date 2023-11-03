import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK:  Label

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Number"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    //MARK: SetUp Views
        private func setUpViews() {
            view.addSubview(label)
        }

    //MARK: SetUp Constraints
    private func setUpConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
}

