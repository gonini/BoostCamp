//
//  MovieTableViewController.swift
//  BoostCamp
//
//  Created by 장공의 on 16/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import UIKit
import Common
import ViewModelInterface
import RxSwift

class MovieTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
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
                    self.tableView.reloadData()
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
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MovieDetailsViewContoller.MOVIE_ID_KEY {
            if let row = tableView?.indexPathForSelectedRow?.row {
                let item = movies[row]
                let toController = segue.destination as! MovieDetailsViewContoller
                toController.movieId = item.id
            }
        }
    }
    
    deinit {
        viewModel?.dispose()
        movies.removeAll()
        progressAlert = nil
        tableView = nil
    }

}


extension MovieTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableCell
        cell.setMovie(movie: movie)
        return cell
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
        let indexPath = IndexPath(row: NSNotFound, section: 0)
        self.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: false)
    }
}


