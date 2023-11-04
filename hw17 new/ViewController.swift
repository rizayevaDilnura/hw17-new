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

    //MARK: Button Play
   private  lazy var generatePlayButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "play"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 3, left: 6, bottom: 3, right: 5)
        button.addTarget(self, action: #selector(generateButtonPressed), for: .touchUpInside)
        return button
    }()

    //MARK: Button Play
   private  lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "pause"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 3, left: 6, bottom: 3, right: 5)
        //button.addTarget(self, action: #selector(generateButtonPressed), for: .touchUpInside)
        return button
    }()

    //MARK: activityIndicatorView
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.isHidden = false
        return activityIndicatorView
    }()

    //MARK: lyfe cycle
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
            view.addSubview(generatePlayButton)
            view.addSubview(pauseButton)
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

        generatePlayButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(40)
            make.leading.equalTo(135)
            make.trailing.equalTo(-225)
           make.width.equalTo(20)
          make.height.equalTo(42)
        }
        pauseButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(40)
            make.leading.equalTo(generatePlayButton.snp.trailing).offset(15)
            make.trailing.equalTo(-160)
           make.width.equalTo(20)
          make.height.equalTo(40)
        }
    }

    //MARK: Actions
        func bruteForce(passwordToUnlock: String) {
            let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }

            var password: String = ""

            while password != passwordToUnlock {
                password = generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)

                DispatchQueue.main.sync { [weak self] in
                    self?.label.text = password
                }
            }
            DispatchQueue.main.sync {
                self.textField.isSecureTextEntry = false
                self.activityIndicatorView.stopAnimating()
                self.activityIndicatorView.isHidden = true
            }
        }

        @objc func generateButtonPressed() {
            activityIndicatorView.startAnimating()
            guard let inputText = textField.text else { return }
            DispatchQueue.global().async { [weak self] in
                self?.bruteForce(passwordToUnlock: inputText)
            }
        }
    }

    extension String {
        var digits:      String { return "0123456789" }
        var lowercase:   String { return "abcdefghijklmnopqrstuvwxyz" }
        var uppercase:   String { return "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
        var punctuation: String { return "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" }
        var letters:     String { return lowercase + uppercase }
        var printable:   String { return digits + letters + punctuation }

        mutating func replace(at index: Int, with character: Character) {
            var stringArray = Array(self)
            stringArray[index] = character
            self = String(stringArray)
        }
    }

    func indexOf(character: Character, _ array: [String]) -> Int {
        return array.firstIndex(of: String(character))!
    }

    func characterAt(index: Int, _ array: [String]) -> Character {
        return index < array.count ? Character(array[index])
                                   : Character("")
    }

    func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
        var str: String = string

        if str.count <= 0 {
            str.append(characterAt(index: 0, array))
        }
        else {
            str.replace(at: str.count - 1,
                        with: characterAt(index: (indexOf(character: str.last!, array) + 1) % array.count, array))

            if indexOf(character: str.last!, array) == 0 {
                str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last!)
            }
        }
        return str
    }



