//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Awal Amadou on 2/27/22.
//

import UIKit




class AthleteFormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var teamTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateView()
    }
    
    var athlete: Athlete?
    
    init?(coder: NSCoder, athlete: Athlete?){
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(){
        guard let athlete = athlete else {
            return
        }
        nameTextField.text = athlete.name
        ageTextField.text = String(athlete.age)
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let age = Int(ageString),
              let team = teamTextField.text,
              let league = leagueTextField.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
    }
}
