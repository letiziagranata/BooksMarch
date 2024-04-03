//
//  ViewController.swift
//  BooksUIKit
//
//  Created by Letizia Granata on 24/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
    @IBOutlet weak var collectionView2: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 160, height: 90)
//        collectionView.collectionViewLayout = layout
        
        collectionView1.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        collectionView2.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView2.delegate = self
        collectionView2.dataSource = self
        
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("youtapped")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1 {
            return sections.count
        } else {
            return sections2.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        if collectionView == collectionView1 {
            let section = sections[indexPath.row]
            cell.imageView.image = UIImage(named: section.imageName)
        } else {
            let section = sections2[indexPath.row]
            cell.imageView.image = UIImage(named: section.imageName)
        }
        return cell
            
    }
        
}

extension ViewController: UICollectionViewDelegateFlowLayout {

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 160, height: 90 )
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 160, height: 90)
//    }
}

