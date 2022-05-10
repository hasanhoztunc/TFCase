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
    private var isPageStillRefreshing: Bool = false
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
    }
    
    override func prepareUI() {
        self.contentsCollectionView.register(UINib(nibName: ContentsConstants.cellIdentifier, bundle: nil),
                                             forCellWithReuseIdentifier: ContentsConstants.cellIdentifier)
        
        self.contentsCollectionView.dataSource = self
        self.contentsCollectionView.delegate = self
        
        let itemSize = UIScreen.main.bounds.width / 2 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize * 3/2)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3

        self.contentsCollectionView.collectionViewLayout = layout
        
        self.searchTextField.addTarget(self, action: #selector(searchContent), for: .primaryActionTriggered)
    }
    
    @objc private func searchContent() {
        if searchTextField.text == nil || searchTextField.text?.isEmpty ?? true {
            return
        }
        self.searchTextField.resignFirstResponder()
        self.viewModel.searchContent(with: self.searchTextField.text ?? "")
    }
}

// MARK: - CollectionViewDataSource

extension ContentsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentsConstants.cellIdentifier, for: indexPath) as! ContentCollectionViewCell
        cell.configureCell(with: self.contents[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.contentDidSelect(with: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.contentsCollectionView.contentOffset.y >= (self.contentsCollectionView.contentSize.height - self.contentsCollectionView.bounds.size.height)) {
            if !self.isPageStillRefreshing {
                self.viewModel.loadMoreContent()
                self.isPageStillRefreshing.toggle()
            }
        }
    }
}

// MARK: - ViewModelDelegate

extension ContentsViewController: ContentsViewModelDelegate {
    
    func contentsDidFetchSuccessfully(_ contents: [ContentCollectionViewCellViewModel]) {
        self.contents = contents
        self.contentsCollectionView.reloadData()
        self.isPageStillRefreshing = false
    }
    
    func navigateToDetail(with data: Content) {
        self.navigate(from: self, to: .contentDetail) { viewController in
            let vc = viewController as! ContentDetailViewController
            let viewModel = ContentDetailViewModel()
            viewModel.content = data
            
            vc.viewModel = viewModel
        }
    }
}
