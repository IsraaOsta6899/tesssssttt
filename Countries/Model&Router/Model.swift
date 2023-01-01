//
//  Model.swift
//  Countries
//
//  Created by Israa Usta on 08/12/2022.
//

import Foundation
import Alamofire
class CountriesModel{
    
    /**
     Get all countries
     - Parameter CompletionHandler: Result<[Country],NSError>
     */
    class func getCountries(CompletionHandler:@escaping(Result<[Country],NSError>)->Void) {
        var allCountries : [Country] = []
        AF.request(CountriesRouter.allCountries).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let JSON = value as? [String: Any] {
                    let data = JSON["data"]
                    if let json2 = data as? [String: Any]{
                        let countries = json2["countries"] as? [[String : Any]] ?? []
                        for country in countries {
                            let countryInstance = Country(dict: country)
                            allCountries.append(countryInstance)
                        }
                        CompletionHandler(.success(allCountries))
                        
                    }
                }
            case .failure(_):
                CompletionHandler(.failure(NSError()))
            }
            
        }
        
    }
    
}
