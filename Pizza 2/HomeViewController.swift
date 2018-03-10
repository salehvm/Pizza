//
//  HomeViewController.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/7/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit
import ScalingCarousel

class CodeCell: ScalingCarouselCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mainView = UIView(frame: contentView.bounds)
        contentView.addSubview(mainView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeViewController: UIViewController {

//    var image = [UIImage(named: "pizza1"),UIImage(named: "pizza2"),UIImage(named: "pizza3"),UIImage(named: "pizza4"),UIImage(named: "pizza5"),UIImage(named: "cocacola1"),UIImage(named: "poppers1")]
    
    
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var addMenu: UIView!
    @IBOutlet weak var carousel: ScalingCarouselView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVars()
        
        
//        addCarousel()
    }
    
    
    func initVars(){
    
            self.tapGestureRecognizer.numberOfTapsRequired = 1
            self.tapGestureRecognizer = UITapGestureRecognizer(
                target: self,
                action: #selector(SideMenu.presentLeftMenuViewController(_:)))
            self.addMenu.addGestureRecognizer(tapGestureRecognizer)
            
            self.tapGestureRecognizer = UITapGestureRecognizer(
                target: self,
                action: #selector(SideMenu.presentRightMenuViewController(_:)))
            self.menuView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        let indexPath = IndexPath(row: 2, section: 0)
//        print(indexPath.item)
//        carousel.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//    }
    
fileprivate var scalingCarousel: ScalingCarouselView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func addCarousel() {
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        scalingCarousel = ScalingCarouselView(withFrame: frame, andInset: 20)
        scalingCarousel.dataSource = self
        scalingCarousel.delegate = self
        scalingCarousel.translatesAutoresizingMaskIntoConstraints = false
        scalingCarousel.backgroundColor = .clear
        
        
        scalingCarousel.register(CodeCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(scalingCarousel)
        
        // Constraints
        scalingCarousel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        scalingCarousel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        scalingCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scalingCarousel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
    }
    
}


extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let scalingCell = cell as? ScalingCarouselCell {
            scalingCell.mainView.backgroundColor = .blue
        }
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        scalingCarousel.didScroll()
    }
}
