//
//  SecondViewController.swift
//  BoostCamp
//
//  Created by 장공의 on 12/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import UIKit
import RxSwift
import Common
import ViewModelInterface

class MoviesCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var movies: [Movie] = [Movie]()
    private var progressAlert: UIActivityIndicatorView?
    var viewModel: MoviesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressAlert = createProgressAlert()
        
        viewModel?.moviesObservable
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: {
                    self.movies.removeAll()
                    self.movies += $0
                    self.collectionView.reloadData()
                    self.scrollToTop()
            }, onError: { _ in
                self.showErrorAlert()
            })
        
        viewModel?.progressObservable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                if($0 == .show) {
                    self.progressAlert?.startAnimating()
                } else {
                    self.progressAlert?.stopAnimating()
                }
            })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MovieDetailsViewContoller.MOVIE_ID_KEY {
            if let row = collectionView?.indexPathsForSelectedItems?.first?.row {
                let item = movies[row]
                guard let toController = segue.destination as? MovieDetailsViewContoller else {
                    return
                }
                
                toController.movieId = item.id
            }
        }
    }
    
    deinit {
        viewModel?.dispose()
        movies.removeAll()
        progressAlert = nil
        collectionView = nil
    }
    
}

extension MoviesCollectionViewController:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollect", for: indexPath) as? MoveCollectionCell else {
            return UICollectionViewCell()
        }
        
        let movie = movies[indexPath.row]
        cell.setMovie(movie: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewCellWithd = collectionView.frame.width / 2 - 1
        
        return CGSize(width: collectionViewCellWithd, height: 327)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let contentSize = scrollView.contentSize.height
        let tableSize = scrollView.frame.size.height - scrollView.contentInset.top - scrollView.contentInset.bottom
        let canLoadFromBottom = contentSize > tableSize
        
        
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let difference = maximumOffset - currentOffset
        
        if canLoadFromBottom, difference <= -120.0 {
            
            let previousScrollViewBottomInset = scrollView.contentInset.bottom
            scrollView.contentInset.bottom = previousScrollViewBottomInset + 50
            
            viewModel?.refresh()
            scrollView.contentInset.bottom = previousScrollViewBottomInset
        }
    }
    
    func scrollToTop() {
        let inset = collectionView.contentInset
        collectionView.contentOffset = CGPoint(x: -inset.left, y: -inset.top)
    }

}
