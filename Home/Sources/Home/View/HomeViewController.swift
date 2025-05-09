// The Swift Programming Language
// https://docs.swift.org/swift-book

//
import UIKit
import ReusableComponent

// MARK: - Public HomeViewController
public class HomeViewController: UIViewController {
    let router: HomeCoordinatorContract = HomeRouter.shared
    // MARK: - Public Initializer
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Home Module"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup View
    private func setupView() {
        view.backgroundColor = .gray
        let profileButton = createNavigationButton()
        // Add subviews
        view.addSubview(titleLabel)
        view.addSubview(profileButton)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Title Label Constraints
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            profileButton.widthAnchor.constraint(equalToConstant: 250),
            profileButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    @objc private func openProfileView() {
        router.openProfileView()
    }
    
    func createNavigationButton() -> UIButton {
        let buttonConfig = ButtonConfiguration(
            title: "Go to Profile Module",
            backgroundColor: .systemBlue,
            titleColor: .white,
            action: { [weak self] in
                self?.openProfileView()
            }
        )
        
        // Ensure the button appears properly
        let button = PrimaryButton(configuration: buttonConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
