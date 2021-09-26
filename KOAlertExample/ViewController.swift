//
//  ViewController.swift
//  KOAlertExample
//
//  Created by Kaan Ozdemir on 12.09.2021.
//

import UIKit
import KOAlert

class ViewController: UIViewController {

    @IBAction func successButtonTapped(_ sender: Any) {
        let alert = KOAlertController(title: "BAŞARILI!", message: "Başarı ile kaydedildi", preferredStyle: .alert, alertType: .success)
        
        alert.addAction(KOAlertAction(title: "Evet", style: .default, handler: { _ in
            print(1231)
        }))
        
        alert.addAction(KOAlertAction(title: "Hayır", style: .destructive, handler: { _ in
            print(321)
        }))
        
        alert.addAction(KOAlertAction(title: "Kapat", style: .cancel, handler: { _ in
            alert.dismiss(animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction func errorButtonTapped(_ sender: Any) {
        let alert = KOAlertController(title: "HATA!", message: "Tekrar denemek ister misiniz ?", preferredStyle: .alert, alertType: .error)
        
        alert.addAction(KOAlertAction(title: "Evet", style: .default, handler: { _ in
            print(1231)
        }))
        
        alert.addAction(KOAlertAction(title: "Hayır", style: .destructive, handler: { _ in
            print(321)
        }))
        
        
        (0...100).forEach { index in
            alert.addAction(KOAlertAction(title: "Kapat \(index)", style: .cancel, handler: { _ in
                alert.dismiss(animated: true)
            }))
        }
        
        present(alert, animated: true)
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        let alert = KOAlertController(title: "BİLGİ!", message: "O iş öyle olmaz.", preferredStyle: .alert, alertType: .custom(image: UIImage(named: "ic_questionn")))
        
        alert.addAction(KOAlertAction(title: "Evet", style: .default, handler: { _ in
            print(1231)
        }))
        
        alert.addAction(KOAlertAction(title: "Hayır", style: .destructive, handler: { _ in
            print(321)
        }))
        
        alert.addAction(KOAlertAction(title: "Kapat", style: .cancel, handler: { _ in
            alert.dismiss(animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction func warningButtonTapped(_ sender: Any) {
        let alert = KOAlertController(title: "UYARI!", message: "Kayda devam etmek istiyor musunuz ?", preferredStyle: .alert, alertType: .warning)
        
        alert.addAction(KOAlertAction(title: "Evet", style: .default, handler: { _ in
            print(1231)
        }))
        
        alert.addAction(KOAlertAction(title: "Hayır", style: .destructive, handler: { _ in
            print(321)
        }))
        
        alert.addAction(KOAlertAction(title: "Kapat", style: .cancel, handler: { _ in
            alert.dismiss(animated: true)
        }))
        
        present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

