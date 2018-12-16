//
//  MovieDetailsViewController.swift
//  BoostCamp
//
//  Created by 장공의 on 13/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import UIKit
import RxSwift
import ViewModelInterface
import Common

class MovieDetailsViewContoller: UIViewController {
    
    var viewModel: MovieDetailsViewModel?
    private var comments: [Comment] = [Comment]()
    private var progressAlert: UIActivityIndicatorView?
    
    public static let MOVIE_ID_KEY = "movie"
    
    var movieId: String?
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var genresAndShowtimes: UILabel!
    @IBOutlet weak var advanceRate: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var totalAttendance: UILabel!
    @IBOutlet weak var story: UITextView!
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        
        progressAlert = createProgressAlert()
        setBackButtonText()
        setUpImageView()
        
        viewModel?.progressObservable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                if($0 == .show) {
                    self.progressAlert?.startAnimating()
                } else {
                    self.progressAlert?.stopAnimating()
                }
            })
        
        viewModel?.requestMovieDetails(movieId: movieId!)
        viewModel?.movieDtailsObservable
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: {
                    self.initView(movieDetails: $0);
            }, onError: { _ in
                self.showErrorAlert()
            })
    }
    
    private func initView(movieDetails: MovieDetails) {
        self.comments.removeAll()
        self.comments += movieDetails.comments
        self.tableview.reloadData()
        
        poster.downloaded(from: URL(string: movieDetails.image)!)
        title = movieDetails.title
        
        movieTitle.text = movieDetails.title
        date.text = "\(movieDetails.date)개봉"
        genresAndShowtimes.text = "\(movieDetails.genre)/\(movieDetails.duration)분"
        grade.text = movieDetails.user_rating
        advanceRate.text =  "\(movieDetails.reservation_grade)위 \(movieDetails.reservation_rate)"
        totalAttendance.text = movieDetails.audience
        story.text = movieDetails.synopsis
    }
    
    private func setBackButtonText() {
        self.navigationController?.navigationBar.topItem?.title = "영화목록"
    }
    
    private func setUpImageView() {
        
        poster.isUserInteractionEnabled = true
        poster.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(onClickImageView))
        )
    }
    
    @objc private func onClickImageView() {
        let toController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageViewContoller") as! ImageViewContoller 
        toController.posterImage = poster.image
        self.show(toController, sender: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel?.dispose()
        comments.removeAll()
        progressAlert = nil
        tableview = nil
    }
    
}

extension MovieDetailsViewContoller: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = comments[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell") as! CommentCell
        
        cell.setComment(comment: comment)
        return cell
    }
}
