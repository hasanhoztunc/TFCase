//
//  ContentsViewModel.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation

final class ContentsViewModel: TFViewModel {
    
    weak var delegate: ContentsViewModelDelegate?
    private var contents: [Content] = []
    
    private var page = 0
    
    func search(text: String) {
        app.service.execute(request: .search(text: text, page: page),
                            responseModel: [Content].self,
                            completion: { [weak self] response in
            switch response {
            case .success(let contents):
                self?.contents = contents
                let viewModels = contents.map({ ContentCollectionViewCellViewModel(contentName: $0.collectionName,
                                                                                  contentImage: $0.smallImage) })
                self?.delegate?.contentsDidFetchSuccessfully(viewModels)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func contentDidSelect(with index: Int) {
        let selectedContent = self.contents[index]
        self.delegate?.navigateToDetail(with: selectedContent)
    }
}
