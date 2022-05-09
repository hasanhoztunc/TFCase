//
//  ViewController.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import UIKit

final class ContentsViewController: TFViewController<ContentsViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var contentsCollectionView: UICollectionView!
    
    // MARK: - Privates
    
    private var contents: [ContentCollectionViewCellViewModel] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
    }
    
    override func prepareUI() {
        self.contentsCollectionView.register(UINib(nibName: ContentsConstants.cellIdentifier, bundle: nil),
                                             forCellWithReuseIdentifier: ContentsConstants.cellIdentifier)
        
        self.contentsCollectionView.dataSource = self
        
        self.searchTextField.addTarget(self, action: #selector(searchContent), for: .primaryActionTriggered)
    }
    
    @objc private func searchContent() {
        if searchTextField.text == nil || searchTextField.text?.isEmpty ?? true {
            return
        }
        self.searchTextField.resignFirstResponder()
        self.viewModel.search(text: self.searchTextField.text ?? "")
    }
}

// MARK: - CollectionViewDataSource

extension ContentsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentsConstants.cellIdentifier, for: indexPath) as! ContentCollectionViewCell
        cell.configureCell(with: self.contents[indexPath.row])
        
        return cell
    }
}

// MARK: - ViewModelDelegate

extension ContentsViewController: ContentsViewModelDelegate {
    
    func contentsDidFetchSuccessfully(_ contents: [ContentCollectionViewCellViewModel]) {
        self.contents = contents
        self.contentsCollectionView.reloadData()
    }
}
