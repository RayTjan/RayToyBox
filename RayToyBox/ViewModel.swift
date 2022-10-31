//
//  ViewModel.swift
//  RayToyBox
//
//  Created by Ray on 31/10/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var items = [PostModel]()
    let prefixURL = "http://localhost:3000"
    
    init(){
        fetchPosts()
    }
    
    //RETRIEVE DATA
    func fetchPosts() {
        guard let url = URL(string: "\(prefixURL)/posts") else {
            print("Not found URL")
            return
        }
        
        URLSession.shared.dataTask(with: url){(data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription)
                return
                
            }
            
            do {
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                    
                } else{
                    print("No Data")
                }
            } catch let JsonError {
                print("fetch json error: ", JsonError.localizedDescription)
            }
        }
    }
    //CREATE DATA
    func createPost(parameters: [String:Any]) {
        guard let url = URL(string: "\(prefixURL)/createPost") else {
            print("Not found URL")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: url){(data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription)
                return
                
            }
            
            do {
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                    
                } else{
                    print("No Data")
                }
            } catch let JsonError {
                print("fetch json error: ", JsonError.localizedDescription)
            }
        }
    }
    //UPDATE DATA
    func updatePost(parameters: [String:Any]) {
        guard let url = URL(string: "\(prefixURL)/updatePost") else {
            print("Not found URL")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: url){(data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription)
                return
                
            }
            
            do {
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                    
                } else{
                    print("No Data")
                }
            } catch let JsonError {
                print("fetch json error: ", JsonError.localizedDescription)
            }
        }
    }
    //DELETE DATA
    func deletePost(parameters: [String:Any]) {
        guard let url = URL(string: "\(prefixURL)/deletePost") else {
            print("Not found URL")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: url){(data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription)
                return
                
            }
            
            do {
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                    
                } else{
                    print("No Data")
                }
            } catch let JsonError {
                print("fetch json error: ", JsonError.localizedDescription)
            }
        }
    }
}
