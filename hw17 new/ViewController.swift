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
        textField.clearButtonMode = .whileEditing
         textField.clearButtonMode = .unlessEditing
         textField.clearButtonMode = .always
        return textField
    }()

    //MARK: Button
    private lazy var generateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
//        button.titleLabel?.text = "Generate"
//        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "play"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 3, left: 6, bottom: 3, right: 5)
        button.addTarget(self, action: #selector(generateButtonPressed), for: .touchUpInside)
        return button

    }()

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.isHidden = false

        return activityIndicatorView
    }()


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
            view.addSubview(generateButton)
            view.addSubview(activityIndicatorView)
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

        generateButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(40)
            make.leading.equalTo(170)
            make.trailing.equalTo(-175)
           make.width.equalTo(30)
          make.height.equalTo(50)
        }

    }

    @objc  func generateButtonPressed() {
        activityIndicatorView.startAnimating()

    }

}

