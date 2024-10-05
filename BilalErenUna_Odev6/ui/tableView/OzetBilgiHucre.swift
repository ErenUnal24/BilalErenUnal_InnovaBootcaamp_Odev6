//
//  OzetBilgiHucre.swift
//  BilalErenUna_Odev6
//
//  Created by Eren on 4.10.2024.
//

import UIKit

class  OzetBilgiHucre: UITableViewCell {
    
    weak var delegate: OzetBilgiHucreDelegate?
    

    @IBOutlet weak var ozetHucreArkaPlan: UIView!
    @IBOutlet weak var ozetMenuHucreArkaPlan: UIView!
    @IBOutlet weak var ozetBilgiSubeLabel: UILabel!
    @IBOutlet weak var ozetBilgiIbanLabel: UILabel!
    @IBOutlet weak var ozetBilgiBakiyeLabel: UILabel!
    @IBOutlet weak var ozetBilgiBakiyeTutarLabel: UILabel!
    
    @IBOutlet weak var paylasButton: UIButton!
    @IBOutlet weak var tumuButton: UIButton!
    
    
    @IBOutlet weak var hesabimButton: UIButton!
    @IBOutlet weak var krediKartimButton: UIButton!
    @IBOutlet weak var netVarligimButton: UIButton!
    @IBOutlet weak var gizleButton: UIButton!
    
    var selectedButton: Anasayfa.OzetBilgiTipi?

    var indexPath : IndexPath?

    override func awakeFromNib() {
        super.awakeFromNib()
     
        ozetBilgiSubeLabel.text = "Kocaeli Üniversitesi/Kocaeli"
        ozetBilgiSubeLabel.font = UIFont.systemFont(ofSize: 16)
        ozetBilgiIbanLabel.text = "TR27 0006 4000 0012 4070 6469 60"
        ozetBilgiIbanLabel.font = UIFont.systemFont(ofSize: 13)
        ozetBilgiBakiyeTutarLabel.text = "0,00 TL"
        ozetBilgiBakiyeLabel.font = UIFont.systemFont(ofSize: 13)
        ozetBilgiBakiyeTutarLabel.font = UIFont.systemFont(ofSize: 18)

        
        let labelColor : UIColor = .white
        ozetBilgiSubeLabel.textColor = labelColor
        ozetBilgiIbanLabel.textColor = labelColor
        ozetBilgiBakiyeLabel.textColor = labelColor
        ozetBilgiBakiyeTutarLabel.textColor = labelColor
        
        tumuButton.backgroundColor = UIColor(named: "Transparan")
        paylasButton.backgroundColor = UIColor(named: "Transparan")
        
        updateButtonStyles()
        
        

        
//        let buttonFontSize: CGFloat = 20
//        hesabimButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
//        krediKartimButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
//        netVarligimButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
//        gizleButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
//        
//       // paylasButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        paylasButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
//        tumuButton.titleLabel?.font = .boldSystemFont(ofSize: 13)

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func hesabimButton(_ sender: UIButton) {
        delegate?.didTapHesabimButton()
    }
    
    @IBAction func krediKartimButton(_ sender: UIButton) {
        delegate?.didTapKrediKartimButton()
    }
    
    @IBAction func netVarligimButton(_ sender: UIButton) {
        delegate?.didTapNetVarligimButton()
    }
    
    @IBAction func gizleButton(_ sender: UIButton) {
    }
    
    func updateButtonStyles() {
        let normalStyle = UIColor.clear
        let selectedStyle = UIColor.blue.withAlphaComponent(0.5)
        let normalTitleColor = UIColor.blue
        let selectedTitleColor = UIColor.white 

        // Hesabım butonu
        hesabimButton.backgroundColor = (selectedButton == .hesabim) ? selectedStyle : normalStyle
        hesabimButton.layer.borderWidth = (selectedButton == .hesabim) ? 2 : 0
        hesabimButton.layer.borderColor = (selectedButton == .hesabim) ? UIColor.blue.cgColor : nil
        hesabimButton.setTitleColor((selectedButton == .hesabim) ? selectedTitleColor : normalTitleColor, for: .normal)
        
        // Kredi Kartım butonu
        krediKartimButton.backgroundColor = (selectedButton == .krediKartim) ? selectedStyle : normalStyle
        krediKartimButton.layer.borderWidth = (selectedButton == .krediKartim) ? 2 : 0
        krediKartimButton.layer.borderColor = (selectedButton == .krediKartim) ? UIColor.blue.cgColor : nil
        krediKartimButton.setTitleColor((selectedButton == .krediKartim) ? selectedTitleColor : normalTitleColor, for: .normal)
        
        // Net Varlığım butonu
        netVarligimButton.backgroundColor = (selectedButton == .netVarligim) ? selectedStyle : normalStyle
        netVarligimButton.layer.borderWidth = (selectedButton == .netVarligim) ? 2 : 0
        netVarligimButton.layer.borderColor = (selectedButton == .netVarligim) ? UIColor.blue.cgColor : nil
        netVarligimButton.setTitleColor((selectedButton == .netVarligim) ? selectedTitleColor : normalTitleColor, for: .normal)
    }


    
}


protocol OzetBilgiHucreDelegate: AnyObject {
    func didTapHesabimButton()
    func didTapKrediKartimButton()
    func didTapNetVarligimButton()
}
