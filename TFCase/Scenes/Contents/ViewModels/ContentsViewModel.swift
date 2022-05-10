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
    private var searchText: String?
    
    func searchContent(with text: String) {
        self.contents = []
        self.search(text: text)
    }
    
    func loadMoreContent() {
        self.page += 1
        self.search(text: self.searchText)
    }
    
    func contentDidSelect(with index: Int) {
        let selectedContent = self.contents[index]
        self.delegate?.navigateToDetail(with: selectedContent)
    }
    
    private func search(text: String?) {
        self.showIndicator(in: self.delegate)
        app.service.execute(request: .search(text: text ?? "", page: page),
                            responseModel: [Content].self,
                            completion: { [weak self] response in
            self?.hideIndicator(in: self?.delegate)
            switch response {
            case .success(let contents):
                self?.searchText = text
                self?.contents.append(contentsOf: contents)
                let viewModels = self?.contents.map({ ContentCollectionViewCellViewModel(contentName: $0.collectionName,
                                                                                  contentImage: $0.smallImage) })
                self?.delegate?.contentsDidFetchSuccessfully(viewModels ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    #warning("wrapperType'a göre section yapısı oluşturma eklenecek. CollectionViewSection mı kullanılacak yoksa segmented control mü kullanılacak karar verilecek.")
    private func groupContents(with models: [Content]) -> [[Content]] {
        var wrappers: Set<String> = Set()
        models.forEach({ content in
            wrappers.insert(content.wrapperType)
        })
        
        var groupedItems: [[Content]] = []
        for content in contents {
            var filteredContents: [Content] = []
            for secondContent in contents {
                if content.wrapperType == secondContent.wrapperType {
                    filteredContents.append(secondContent)
                }
            }
            groupedItems.append(filteredContents)
        }
        return groupedItems
    }
    
    private func groupViewModels(with groupedModels: [[Content]]) -> [[ContentCollectionViewCellViewModel]] {
        var groupedItems: [[ContentCollectionViewCellViewModel]] = []
        for model in groupedModels {
            var filteredContents: [ContentCollectionViewCellViewModel] = []
            for item in model {
                filteredContents.append(ContentCollectionViewCellViewModel(contentName: item.collectionName, contentImage: item.smallImage))
            }
            groupedItems.append(filteredContents)
        }
        return groupedItems
    }
}
