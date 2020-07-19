//
//  LinksStore.swift
//  NYTimes
//
//  Created by Загребельский Валентин on 17.07.2020.
//  Copyright © 2020 Загребельский Валентин. All rights reserved.
//

let mostSharedUrlString = "https://api.nytimes.com/svc/mostpopular/v2/shared/30/facebook.json?api-key=517wGvBNGAGMylj8lm92uZpaYW0gPpUP"

let mostEmailedUrlString = "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=517wGvBNGAGMylj8lm92uZpaYW0gPpUP"

let mostViewedUrlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=517wGvBNGAGMylj8lm92uZpaYW0gPpUP"

var counter: Dictionary<String, Int> = [mostEmailedUrlString: 1, mostSharedUrlString: 1, mostViewedUrlString: 1]
