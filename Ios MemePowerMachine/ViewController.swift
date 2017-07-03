//
//  ViewController.swift
//  Ios MemePowerMachine
//
//  Created by Luis Miguel Bravo on 7/2/17.
//  Copyright © 2017 Luis Miguel Bravo. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    

    @IBOutlet weak var maximoValorXLabel: UILabel!
    @IBOutlet weak var xlabel: UILabel!
    
    
    @IBOutlet weak var maximoValorYLabel: UILabel!
    @IBOutlet weak var ylabel: UILabel!
    
    @IBOutlet weak var maximoValorZLabel: UILabel!
    @IBOutlet weak var zlabel: UILabel!
    
    @IBOutlet weak var maximoValorMagnitudLabel: UILabel!
    @IBOutlet weak var magnitudLabel: UILabel!

    var maximoValorX:Double = 0
    var maximoValorY:Double = 0
    var maximoValorZ:Double = 0

    var sumaDeMagnitudes:Double = 0
    var maximoValorMagnitud:Double = 0
    
    
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        motionManager.accelerometerUpdateInterval = 0.001;
        
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data {
                // print(myData)
                self.xlabel.text = String(myData.acceleration.x)
                if (abs(myData.acceleration.x) > self.maximoValorX)
                {
                    self.maximoValorX = myData.acceleration.x
                    self.maximoValorXLabel.text = String(self.maximoValorX)
                }
                
                self.ylabel.text = String(myData.acceleration.y)
                if (abs(myData.acceleration.y) > self.maximoValorY)
                {
                    self.maximoValorY = myData.acceleration.y
                    self.maximoValorYLabel.text = String(self.maximoValorY)
                }
                
                self.zlabel.text = String(myData.acceleration.z)
                if (abs(myData.acceleration.z) > self.maximoValorZ)
                {
                    self.maximoValorZ = myData.acceleration.z
                    self.maximoValorZLabel.text = String(self.maximoValorZ)
                }
                
                self.sumaDeMagnitudes = abs(myData.acceleration.x) + abs(myData.acceleration.y) + abs(myData.acceleration.z)
                self.magnitudLabel.text = String(self.sumaDeMagnitudes)
                if (self.sumaDeMagnitudes > self.maximoValorMagnitud) {
                    self.maximoValorMagnitud = self.sumaDeMagnitudes
                    self.maximoValorMagnitudLabel.text = String(self.maximoValorMagnitud)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ReiniciarContadores(_ sender: UIButton) {
        self.maximoValorX = 0
        self.maximoValorY = 0
        self.maximoValorZ = 0
        self.maximoValorMagnitud = 0
    }
    


}

