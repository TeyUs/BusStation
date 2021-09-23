//
//  DiscoverService.swift
//  Ogr_UIPageViewController5
//
//  Created by teyhan.uslu on 13.09.2021.
//

import Foundation
import Alamofire

class DiscoverService{
    
    weak var vc:DiscoverViewController?
    
    var discoverCells = [DiscoverCell]()
    
    func alamofireAnyDiscovers(url: DiscoverTypes){
        AF.request(url.url, method: .get).responseJSON{ response in
            if let data = response.data{
                do{
                    let resp = try JSONDecoder().decode(Movies.self, from: data)
//                    print(resp)
//                        print(#function)
                    self.discoverCells.append(DiscoverCell(collectName: url.names, movie: resp.results))
                    self.vc!.reload(discoCells: self.discoverCells)
                }catch{
                    print("kötü")
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func alamofireAllDiscovers(){
        alamofireAnyDiscovers(url: .mostPopular)
        alamofireAnyDiscovers(url: .upcoming)
        alamofireAnyDiscovers(url: .nowPlaying)
        
    }
}
