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
    
}


extension MovieTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        cell.setMovie(movie: movie)
        return cell
    }
    
}


