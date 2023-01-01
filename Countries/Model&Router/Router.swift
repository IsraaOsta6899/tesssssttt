//
//  Router.swift
//  Countries
//
//  Created by Israa Usta on 08/12/2022.
//

import Foundation
import Alamofire
enum CountriesRouter: URLRequestConvertible {
    
    // case all countries to make request to get all countries from API
    case allCountries
    
    // base url that exsist in all request in this router
    var baseURL: String {
        switch self {
        case .allCountries:
            return "https://gateway.harri.com"
        }
    }
    
    // ending path for each case
    var path: String {
        switch self {
        case .allCountries :
            return "/core/api/v1/public_job/getActiveFilters"
        }
        
    }
    
    // http methode for each case
    var method: HTTPMethod {
        switch self {
        case  .allCountries:
            return .get
        }
        
    }
    
    
    // method to return completed request
    func asURLRequest() throws -> URLRequest {
        
        let url = try baseURL.asURL().appendingPathComponent(path).absoluteString
        var request = URLRequest(url: URL(string: url)!)
        request.method = method
        return request
    }
}



