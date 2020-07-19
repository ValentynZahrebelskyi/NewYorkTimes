//
//  ArticleModel.swift
//  NYTimes
//
//  Created by Загребельский Валентин on 17.07.2020.
//  Copyright © 2020 Загребельский Валентин. All rights reserved.
//

import Foundation
import Alamofire

struct DocModel: Decodable {
    let status: String
    let copyright: String
    let num_results: Int
    let results: [ArticleModel]
}

struct ArticleModel: Decodable {
    let uri: String
    let url: String
    let id: Int
    let asset_id: Int
    let source: String
    let published_date: String
    let updated: String
    let section: String
    let subsection: String
    let nytdsection: String
    let adx_keywords: String
    let column: String?
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let des_facet: [String]
    let org_facet: [String]
    let per_facet: [String]
    let geo_facet: [String]
    let media: [Media]
    let eta_id: Int
    
    
}

struct Media: Decodable {
    let type: String
    let subtype: String
    let caption: String
    let copyright: String
    let approved_for_syndication: Int
//    let media_metadata: [MetaData]
}

struct MetaData: Decodable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}
