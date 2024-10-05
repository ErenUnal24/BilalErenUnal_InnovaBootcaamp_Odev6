//
//  ViewController.swift
//  BilalErenUna_Odev6
//
//  Created by Eren on 4.10.2024.
//

import UIKit

class Anasayfa: UIViewController, OzetBilgiHucreDelegate {


    enum OzetBilgiTipi {
        case hesabim
        case krediKartim
        case netVarligim
    }
    
    var ozetBilgiTipi: OzetBilgiTipi = .hesabim
    var selectedButton: OzetBilgiTipi = .hesabim
    
    
    
    var hesapListesi = [Hesap]()
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self

        let hesap1 = Hesap(sube: "Kocaeli Üniversitesi/Kocaeli", iban: "TR27 0006 4000 0012 4070 6469 60", bakiye: "1234,56 TL")
        hesapListesi.append(hesap1)
        
        searchBar.layer.cornerRadius = 17
        searchBar.layer.masksToBounds = true
   
    }
  
    func didTapHesabimButton() {
        selectedButton = .hesabim
        ozetBilgiTipi = .hesabim
        tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
        
    func didTapKrediKartimButton() {
        selectedButton = .krediKartim
        ozetBilgiTipi = .krediKartim
        tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
        
    func didTapNetVarligimButton() {
        selectedButton = .netVarligim
        ozetBilgiTipi = .netVarligim
        tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hesapListesi.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == hesapListesi.count {
            let hucre = tableView.dequeueReusableCell(withIdentifier: "beyazAlanHucre", for: indexPath) as! BeyazAlanHucre
        
            hucre.mobilBorsaLabel.text = "Mobil Borsa"
            hucre.paraCekLabel.text = "Para Çek"
            hucre.yatirimPortfoyumLabel.text = "Yatırım Portföyüm"
            hucre.kısayollarimArkaPlan.text = "Kısayollarım"
            
            hucre.beyazAlanArkaPlan.layer.cornerRadius = 10
           
            
            return hucre
        } else {
            let hucre = tableView.dequeueReusableCell(withIdentifier: "ozetBilgiHucre", for: indexPath) as! OzetBilgiHucre
            let hesap = hesapListesi[indexPath.row]
            
            
             switch ozetBilgiTipi {
                     case .hesabim:
                 hucre.ozetBilgiSubeLabel.text = hesap.sube
                 hucre.ozetBilgiIbanLabel.text = hesap.iban
                 hucre.ozetBilgiBakiyeLabel.text = "Bakiye"
                 hucre.ozetBilgiBakiyeTutarLabel.text = "\(hesap.bakiye!)"
                 hucre.ozetBilgiBakiyeTutarLabel.font = .boldSystemFont(ofSize: 18)
                         
                     case .krediKartim:
                         hucre.ozetBilgiSubeLabel.text = "Kredi Kartı Bilgileri"
                         hucre.ozetBilgiIbanLabel.text = "Kart No: 1234 5678 9012 3456"
                         hucre.ozetBilgiBakiyeTutarLabel.text = "Kalan Limit: 5000 TL"
                         
                     case .netVarligim:
                         hucre.ozetBilgiSubeLabel.text = "Net Varlık Bilgileri"
                         hucre.ozetBilgiIbanLabel.text = "Varlık: Mevduat + Yatırım"
                         hucre.ozetBilgiBakiyeTutarLabel.text = "Toplam: 15,000 TL"
                     }
             

            hucre.backgroundColor = .lightGray
            hucre.ozetHucreArkaPlan.layer.cornerRadius = 10
            hucre.selectionStyle = .gray
            hucre.delegate = self
            
            return hucre
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row == hesapListesi.count {
                return 500
            } else {
                return 265 
            }
        }
}



