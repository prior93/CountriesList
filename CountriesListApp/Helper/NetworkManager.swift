//
//  NetworkManager.swift
//  CountriesListApp
//
//  Created by Arkadijs Makarenko on 04/02/2021.
//

import Foundation
import Alamofire


class NetworkManager {
    
    static private let jsonUrl = "https://restcountries.eu/rest/v2/all"
    static func fetchData(completion: @escaping ([Country])-> () ) {
        AF.request(jsonUrl).validate().responseJSON{ jsonData in
            switch jsonData.result{
            case .success(let value):
                let countries = Country.getArray(from: value)
                completion(countries ?? [])
            case .failure(let error):
            print("error",error)
            
            }
            
        }    }
}
