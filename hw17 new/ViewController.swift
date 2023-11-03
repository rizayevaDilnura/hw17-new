import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK:  Label
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Number"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()

//MARK: TextField
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "Number"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .lightGray
        textField.textColor = .black

        return textField
    }()

    //MARK: Button
   // private lazy var


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
    }

    //MARK: SetUp Views
        private func setUpViews() {
            view.backgroundColor = .white
            view.addSubview(label)
            view.addSubview(textField)
        }

    //MARK: SetUp Constraints
    private func setUpConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.trailing.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(0)
        }
        textField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(100)
            make.leading.equalTo(120)
            make.trailing.equalTo(-120)
            make.height.equalTo(59)
        }
    }
}

