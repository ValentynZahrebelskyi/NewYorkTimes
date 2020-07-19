//
//  ParsingManager.swift
//  NYTimes
//
//  Created by Загребельский Валентин on 17.07.2020.
//  Copyright © 2020 Загребельский Валентин. All rights reserved.
//

import Foundation
import Alamofire

class NetworkServiseManager {
    func alamo(source: String?, _ closure: @escaping ((DocModel) -> ())) {
        DispatchQueue.main.async {
            guard let source = source else { return }
            let header: HTTPHeaders = [
            .accept("application/json")
            ]
            AF.request(source, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                guard let data = response.data else { return }
                do{
                    let articles = try JSONDecoder().decode(DocModel.self, from: data)
                    print(response)
                    closure(articles)
                } catch {
                    print("Critical error -- \(error)")
                }
            }
        }
    }
}
