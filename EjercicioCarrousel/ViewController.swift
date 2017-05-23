//
//  ViewController.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Attributes -
    var carousels = [Carousel]()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureView()
        getCarouselsData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private methods -
    private func configureView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.registerUITableViewCell(CarouselTableCell.self)
    }
    
    private func getCarouselsData() {
        
        guard let overlayFileURLString = Bundle.main.path(forResource: "carousel", ofType: "json") else {
            return
        }
        
        let overlayFileURL = URL(fileURLWithPath: overlayFileURLString)
        
        let data = try! Data(contentsOf: overlayFileURL)
        let object = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        if let arrayJson = object as? [[String: Any]] {
            for carouselJson in arrayJson {
                carousels.append(Carousel(json: carouselJson))
            }
        } else {
            fatalError("Invalid JSON")
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate -
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carousels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellUITableViewCell(forIndexPath: indexPath) as CarouselTableCell
        cell.configureWithCarousel(carousel: carousels[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let carousel = carousels[indexPath.row]
        
        if carousel.type == CarouselCollectionCellType.poster.rawValue {
            return 205.0
        } else {
            return 100.0
        }
    }
}

// MARK: - CarouselTableCellDelegate -
extension ViewController: CarouselTableCellDelegate {
    
    func displayNoVideoMessage() {
        self.showAlert("Video no disponible")
    }
    
    func playVideo(for carouselItem: CarouselItem) {
        self.displayVideo(fromURL: carouselItem.video)
    }
}
