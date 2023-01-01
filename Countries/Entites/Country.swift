//
//  Country.swift
//  Countries
//
//  Created by Israa Usta on 12/12/2022.
//

import Foundation

struct Country: Codable {
    /// country code
    var code: String = ""
    
    /// country dial code
    var dialCode: String?
    
    /// country id
    var id: Int
    
    /// country name
    var name: String
    
    enum CodingKeys : String , CodingKey {
        case code
        case id
        case dialCode = "dial_code"
        case name
    }
    enum AdditionalKeys : String {
        case additionalName = "name1"
    }
    init(dict : Dictionary<String, Any>) {
        self.init()
       
        if let countryCode = dict[CodingKeys.code.rawValue] as? String{
            self.code = countryCode
        }
        if let countryId = dict[CodingKeys.id.rawValue] as? Int{
            self.id = countryId
        }
        if let countryDialCode = dict[CodingKeys.dialCode.rawValue] as? String{
            self.dialCode = countryDialCode
        }
        if let name1 = dict[AdditionalKeys.additionalName.rawValue] as? String {
            self.name = name1
        }else if let countryName = dict[CodingKeys.name.rawValue] as? String{
            self.name = countryName
        }

    }
    init() {

        self.id = 0
        self.name = ""
        self.code = ""
    }
}
