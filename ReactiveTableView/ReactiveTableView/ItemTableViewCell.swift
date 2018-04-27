//
//  ItemTableViewCell.swift
//  ReactiveTableView
//
//  Created by Alexander Zaak on 27.04.18.
//  Copyright © 2018 Alexander Zaak. All rights reserved.
//

import UIKit
import RxSwift

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var disposeBag:DisposeBag = DisposeBag()
    
    override func prepareForReuse() {
        disposeBag = DisposeBag()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
