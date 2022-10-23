import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var timeProgressBar: UIProgressView!
    
    var quizBrain: QuizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionText.text = quizBrain.getQuestion()
        timeProgressBar.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = quizBrain.getScore()
    }

    @IBAction func optionButton(_ sender: UIButton) {
        
        //validate answer
        if quizBrain.validateAnswer(answer: sender.currentTitle!)==true{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        //reset button
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            sender.backgroundColor = UIColor.clear
        }
        
        //get question
        questionText.text = quizBrain.getQuestion()
        timeProgressBar.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = quizBrain.getScore()
        
    }
}

