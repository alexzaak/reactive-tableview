## Reactive TableView

Simple example of a reactive TableView with Swift 4, RxSwift 4, RxCocoa 4 and Xcode 9.3


```Swift
...

var items: Observable<[String]> = Observable.just(["Iron Man (2008)", ...])
    
var disposeBag = DisposeBag()
    
override func viewDidLoad() {
   super.viewDidLoad()
   self.tableView.dataSource = nil
   self.tableView.delegate = nil
        
   self.setupTableView()
   ...
}
    
private func setupTableView() {
   self.items
       .bind(to: self.tableView.rx.items(cellIdentifier: "ItemTableViewCell", cellType: ItemTableViewCell.self)) {
        (_, title: String, cell: ItemTableViewCell) in
                cell.titleLabel.text = title
        }.disposed(by: disposeBag)
}

...

```
