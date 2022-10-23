import Foundation

struct QuizBrain {
    
    var nextQuestions: Int = -1
    var answerToQuestion: Bool = false
    var score: Int = 0
    let quiz: [Question] = [
        Question(text: "A slug's blood is green.", answer: "True"),
        Question(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(text: "Google was originally called 'Backrub'.", answer: "True"),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    

    mutating func getQuestion() -> String{
        
        //update question counter
        nextQuestions = nextQuestions+1
        
        //validate next question number
        if nextQuestions >= quiz.count{
            
            //reset parameters
            nextQuestions = 0
            
            //reset score
            score = 0
        }
        
        //load answer
        answerToQuestion = truncateBool(boolStr: quiz[nextQuestions].answer)
        
        return quiz[nextQuestions].text
        
    }
    
    func getProgress()->Float{
        
        //validate next question number
        if nextQuestions >= quiz.count{
            //reset progress
            return 0
        }else{
            return Float(nextQuestions+1)/Float(quiz.count)
        }
        
    }
    
    mutating func validateAnswer(answer : String)-> Bool{
        
        if truncateBool(boolStr :answer) == answerToQuestion{
            print("Right answer!")
            //update score
            score = score + 1
            return true
        }else{
            print("Wrong answer!")
            return false
        }
    }
    
    func getScore()-> String{
        return "Score: \(score) of \(quiz.count)."
    }
    
    func truncateBool(boolStr : String)->Bool{
        
        //format string
        let boolStr =  boolStr.lowercased()
        
        if boolStr=="true"{
            return true
        }else{
            return false
        }
    }
}
