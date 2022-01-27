//
//  ViewController.swift
//  Homework 5
//
//  Created by Дмитрий Куприенко on 19.12.2021.
//

import UIKit
import SDWebImage
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var resultsCollectionView: UICollectionView!
    
    public var dataArray: [Data1] = Line.list
    public var numberOfMembers = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        let requestUrl = "https://app.fakejson.com/q?token=243_yyEaGDR6VWXXptRIJQ"
        let requestParameters: [String:[String: Any]] = [
            "data": [
                "name": "nameFirst",
                "image": "https://picsum.photos/200/200",
                "age": "numberInt",
                "_repeat": numberOfMembers
            ]
        ]
        
        AF.request(requestUrl, method:.post, parameters: requestParameters).responseJSON { [self]data1 in
            
            do {
                let defaultName = "Tony"
                let defaultAge = 42
                let defaultImage = "nil"
                var index1 = 0

                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode([requestData].self, from: data1.data!)
                for _ in responseModel {
                    if index1 != numberOfMembers {
                        self.dataArray.append(Data1(name: responseModel[index1].name ?? defaultName, image: responseModel[index1].image ?? defaultImage, age: responseModel[index1].age ?? defaultAge))
                        index1 += 1
                    }
                }

                self.resultsCollectionView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = resultsCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell()}

        let item = dataArray[indexPath.row]
        cell.setupCell(item: item)
        
        return cell
    }
    
    
}
