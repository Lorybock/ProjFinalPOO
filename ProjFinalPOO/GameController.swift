//
//  GameController.swift
//  ProjFinalPOO
//
//  Created by Lorena Paiva de Figueiredo on 18/11/17.
//  Copyright © 2017 Lorena Paiva de Figueiredo. All rights reserved.
//

import UIKit

class GameController: UIViewController, UITextFieldDelegate, UIPopoverControllerDelegate{
    

    @IBOutlet weak var labelQuestionTrivia: UILabel!
    @IBOutlet weak var labelDicas: UILabel!
    @IBOutlet weak var TextFieldResp: UITextField!
    private var cont = 0
    private var ts = Array<Trivia>()
    @IBOutlet weak var labelTime: UILabel!
    private var dicas:String = ""
    private var timer = Timer()
    private var contT = 0
    private var qt = 0
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back() {
        //this will be called when popuviewcontroller call valueschanged on delegate object
        createGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createGame()
//        self.TextFieldResp.delegate = self
    }
    

    
    @IBAction func getMoreDicas(_ sender: Any) {
        if(self.cont < 3){
            self.dicas += "\n"
            self.labelDicas.text = dicas
            getTrivia()
        }
    }

    func createTrivia(){
        ts = CreateTrivia().getTrivias()
        getTrivia()
    }
    
    func createGame() {
        self.TextFieldResp.delegate = self
        cont = 0
        qt = 0
        dicas = ""
        self.labelDicas.text = dicas
        createTrivia()
        time();
        contT = 10
        labelTime.text = "\(contT)"
        self.labelQuestionTrivia.text = "\(qt+1)/10"
    }
    
    
    func getTrivia() {
        contT -= 5
        self.dicas += (ts[qt].getDicas(numDica: self.cont))
        self.labelDicas.text = dicas
        self.cont+=1
    }
    
    func getNewTrivia() {
        contT += 10
        self.cont = 0;
        self.dicas = (ts[qt].getDicas(numDica: self.cont))
        self.labelDicas.text = dicas
        self.cont+=1
    }
    
    func time(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameController.counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter() {
        contT -= 1
        if(contT <= 0){
            //ACABOU
            timer.invalidate()
            self.labelDicas.text = "ACABOU"
            self.performSegue(withIdentifier: "PopupViewController", sender: self)
            
        }
        if(contT > 9 || contT < 0){
            labelTime.text = "\(contT)"
        }else{
            labelTime.text = "0\(contT)"
        }
        
    }

    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "PopupViewController"){
            let popup:PopupViewController = segue.destination as! PopupViewController
            popup.delegate = self
            popup.quantAcertado = qt
            popup.tempo = contT
            popup.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            popup.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(TextFieldResp.text! == ""){
           self.labelDicas.text = "VAZIO"
        }else{
            if(ts[qt].testResp(resp: TextFieldResp.text!)){
                qt+=1
                self.labelQuestionTrivia.text = "\(qt+1)/10"
                TextFieldResp.text = ""
                if(qt < 10){
                    //ACERTOU - GET NOVA TRIVIA
                   getNewTrivia()
                }else{
                //VENCEU
                self.labelDicas.text = "GANHOU"
                    timer.invalidate()
                    self.performSegue(withIdentifier: "PopupViewController", sender: self)
                }
            }else{
                //ERROU
                if((contT-3) <= 0){
                    contT = 1
                }else{
                    contT-=3;
                }
                
            }
        }
        return true
    }
    
    
    
}

