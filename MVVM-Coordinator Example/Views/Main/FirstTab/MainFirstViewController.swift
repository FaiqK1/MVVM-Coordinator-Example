//
//  MainFirstViewController.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import SwiftUI
import Combine

class MainFirstViewController: UIViewController {
    var viewModel: MainFirstTabViewModel!
    private var subscribers = Set<AnyCancellable>()
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    @objc private func editButtonTapped() {
        let detailView = UIHostingController(rootView: MainFirstDetailView(viewModel: viewModel))
        navigationController?.pushViewController(detailView, animated: true)
    }
}

//MARK: UI Setup
extension MainFirstViewController {
    private func setupUI() {
        view.backgroundColor = .orange
        setupNavigationBarItem()
        setupLabel()
    }

    private func setupNavigationBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(editButtonTapped)
        )
    }

    private func setupLabel() {
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First VC (UIKit)"
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

//MARK: Label Binding & UI Update

extension MainFirstViewController {
    private func bindViewModel() {
        viewModel.$name.combineLatest(viewModel.$message)
            .sink { [weak self] name, message in
                let emptyString = "-"
                self?.updateLabel(with: name.isEmpty ? emptyString : name,
                                  message: message.isEmpty ? emptyString : message)
            }
            .store(in: &subscribers)
    }
    
    private func updateLabel(with name: String, message: String) {
        let formattedText = NSMutableAttributedString()
        let boldttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        let regularAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 24)
        ]
        
        formattedText.append(NSAttributedString(string: "First VC (UIKit)\n\n", attributes: regularAttributes))
        formattedText.append(NSAttributedString(string: "Name:\n", attributes: regularAttributes))
        formattedText.append(NSAttributedString(string: "\(name)\n\n", attributes: boldttributes))
        formattedText.append(NSAttributedString(string: "Message:\n", attributes: regularAttributes))
        formattedText.append(NSAttributedString(string: "\(message)", attributes: boldttributes))
        
        label.attributedText = formattedText
    }
}
