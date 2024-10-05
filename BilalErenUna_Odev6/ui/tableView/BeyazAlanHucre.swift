//
//  BeyazAlanHucre.swift
//  BilalErenUna_Odev6
//
//  Created by Eren on 5.10.2024.
//


import UIKit

class BeyazAlanHucre: UITableViewCell {
    
    @IBOutlet weak var beyazAlanArkaPlan: UIView!
    @IBOutlet weak var kısayollarimArkaPlan: UILabel!
    @IBOutlet weak var mobilBorsaLabel: UILabel!
    @IBOutlet weak var paraCekLabel: UILabel!
    @IBOutlet weak var yatirimPortfoyumLabel: UILabel!
    
    @IBOutlet weak var mobilBorsaButton: UIButton!
    @IBOutlet weak var paraCekButton: UIButton!
    @IBOutlet weak var yatirimButton: UIButton!
    
    let titleLabel = UILabel()
    let arrowImageView = UIImageView()
    var isExpanded = false
    var expandAction: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mobilBorsaButton.layer.cornerRadius = 14
        paraCekButton.layer.cornerRadius = 14
        yatirimButton.layer.cornerRadius = 14
        
        setupExpandableSection()
    }

    private func setupExpandableSection() {
        titleLabel.text = "Yaklaşan Ödemelerim"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        arrowImageView.image = UIImage(systemName: "chevron.down")
        arrowImageView.isUserInteractionEnabled = true
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(arrowImageView)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleContent))
        arrowImageView.addGestureRecognizer(tapGesture)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: beyazAlanArkaPlan.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: beyazAlanArkaPlan.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -8),
            arrowImageView.topAnchor.constraint(equalTo: beyazAlanArkaPlan.bottomAnchor, constant: 16),
            arrowImageView.trailingAnchor.constraint(equalTo: beyazAlanArkaPlan.trailingAnchor, constant: -16),
            arrowImageView.widthAnchor.constraint(equalToConstant: 24),
            arrowImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc private func toggleContent() {
        isExpanded.toggle()
        arrowImageView.image = isExpanded ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
        expandAction?()
    }
}
