//
//  NetworkService.swift
//  Selfies
//
//  Created by Andy Nadal on 8/10/21.
//

import Foundation

final class NetworkService {
    func callService(_ callback: @escaping (ServiceResponse) -> Void) {
        guard let url = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld") else {
            debugLog("Invalid link", in: .networking)
            return
        }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                debugLog("Error in Network Request", in: .networking, with: error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                debugLog("Non-200 Response Status Code", in: .networking)
                return
            }
            
            guard let data = data else {
                debugLog("There's no Data in the Response", in: .networking)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ServiceResponse.self, from: data)
                callback(response)
            } catch {
                debugLog("Unable to parse data", in: .networking, with: error)
            }
        }
        
        task.resume()
    }
}
