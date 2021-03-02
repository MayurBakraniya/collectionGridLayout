//
//  ViewController.swift
//  gridLayout
//
//  Created by MAC on 02/03/21.
//

import UIKit
import CollectionViewGridLayout

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var numberOfColumns: Int = 3
    
    var overViewArr = [#imageLiteral(resourceName: "Group 621"),#imageLiteral(resourceName: "Group 39"),#imageLiteral(resourceName: "Group 548"),#imageLiteral(resourceName: "logo"),#imageLiteral(resourceName: "Group 22-1"),#imageLiteral(resourceName: "contacts"),#imageLiteral(resourceName: "Group 24"),#imageLiteral(resourceName: "Group 13"),#imageLiteral(resourceName: "settings-2"),#imageLiteral(resourceName: "settings-1"),#imageLiteral(resourceName: "Group 23"),#imageLiteral(resourceName: "Vector")]
    var overviewDesArr = ["Profile","Currency","Charity","My SENG","Pools","Contact","Tips","Message","Chat","Settings","Payments","Service"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionViewSetup()
    }
    
    func collectionViewSetup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
   
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, numberOfColumnsForSection section: Int) -> Int {
        return self.numberOfColumns
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return overViewArr.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imgView.image = overViewArr[indexPath.row]
        cell.lbl.text = overviewDesArr[indexPath.row]
        return cell
    }

}

extension ViewController:CollectionViewDelegateVerticalGridLayout{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, rowSpacingForSection section: Int) -> CGFloat {
        return 10
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnSpacingForSection section: Int) -> CGFloat {
        return 10
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSection section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, heightForItemAt indexPath: IndexPath, columnWidth: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.height/5
    }


    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select [\(indexPath.section), \(indexPath.row)]")
    }
}
