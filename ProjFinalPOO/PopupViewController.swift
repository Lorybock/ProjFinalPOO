//
//  PopupViewController.swift
//  ProjFinalPOO
//
//  Created by Lorena Paiva de Figueiredo on 20/11/17.
//  Copyright © 2017 Lorena Paiva de Figueiredo. All rights reserved.
//

import UIKit

protocol UIPopoverControllerDelegate {
    func back()
}

class PopupViewController: UIViewController {
    @IBOutlet weak var labelPrincipal: UILabel!
    
    @IBOutlet weak var labelSecundaria: UILabel!
    @IBOutlet weak var btJogo: UIButton!
    var quantAcertado = 0
    var tempo = 0
    var delegate: UIPopoverControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(quantAcertado)
        
        if(self.quantAcertado == 10){
            self.labelPrincipal.text = "Ganhou!"
            btJogo.setTitle("Proxima Fase", for: .normal)
        }else{
            labelPrincipal.text = "Perdeu!"
        }
        self.labelSecundaria.text = "Acertos: \(quantAcertado)\nTempo Restante:\(tempo) seg"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btJogo(_ sender: Any) {
        //Tentar novamente
        if(self.quantAcertado < 10){
            delegate?.back()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
