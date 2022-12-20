//
//  ViewModel.swift
//  testProject
//
//  Created by Ashwath Ramanan on 17/12/22.
//

import Combine
import Foundation

class ViewModel: ObservableObject {
    let urlString: String = "https://gist.githubusercontent.com/russellbstephens/9e528b12fd1a45a7ff4e4691adcddf10/raw/5ec8ce76460e8f29c9b0f99f3bf3450b06696482/people.json"
    private var anyCancellable: AnyCancellable?
    @Published var people: [Person] = []
    
    func fetchList() {
        guard let url = URL(string: urlString) else { return }
        anyCancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }, receiveValue: {
                self.people = $0.people.map { Person(name: $0.name, language: $0.language) }
            })
    }
}
