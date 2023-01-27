//
//  OperateCollectionViewController.swift
//  NumberMachine2
//
//  Created by liao on 2022/12/26.
//  Copyright © 2022 liao. All rights reserved.
//

import Foundation
import UIKit

class OperateCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet weak var cv_operate: UICollectionView!
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("LIAO_36")
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("LIAO_41")
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("LIAO_47")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "test", for: indexPath) as! WaitNumViewCell
        cell.waitNumText?.text = "01"
        
        print("LIAO_49")
        return cell
    }
}
