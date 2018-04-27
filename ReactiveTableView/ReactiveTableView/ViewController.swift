//
//  ViewController.swift
//  ReactiveTableView
//
//  Created by Alexander Zaak on 27.04.18.
//  Copyright © 2018 Alexander Zaak. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Toast_Swift // only to show selected cells

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: Observable<[String]> = Observable.just(["Iron Man (2008)", "The Incredible Hulk (2008)","Iron Man 2 (2010)", "Thor (2011)","Captain America: The First Avenger (2011)", "Marvel's The Avengers (2012)","Iron Man 3 (2013)", "Thor: The Dark World (2013)","Captain America: The Winter Soldier (2014)", "Guardians of the Galaxy (2014)","Avengers: Age of Ultron (2015)", "Ant-Man (2015)", "Captain America: Civil War (2016)","Doctor Strange (2016)","Guardians of the Galaxy Vol. 2 (2017)","Spider-Man: Homecoming (2017)","Thor: Ragnarok (2017)","Black Panther (2018)","Avengers: Infinity War (2018)"])
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = nil
        self.tableView.delegate = nil
        
        self.setupTableView()
        self.setupCellSelected()
        self.setupCelldeselected()
    }
    
    private func setupTableView() {
        self.items
            //.map{
            //    $0.filter{ $0.contains("Iron Man")} // filter your list
            // }
            .bind(to: self.tableView.rx.items(cellIdentifier: "ItemTableViewCell", cellType: ItemTableViewCell.self)) {
                (_, title: String, cell: ItemTableViewCell) in
                cell.titleLabel.text = title
            }.disposed(by: disposeBag)
    }
    
    private func setupCellSelected() {
        self.tableView.rx.modelSelected(String.self).subscribe(onNext: {
            title in
            self.view.makeToast("Selected: \(title)")
        }).disposed(by: disposeBag)
    }
    
    private func setupCelldeselected() {
        self.tableView.rx.modelDeselected(String.self).subscribe(onNext: {
            title in
            self.view.makeToast("Deselected: \(title)", duration: 3.0, position: .top)
        }).disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

