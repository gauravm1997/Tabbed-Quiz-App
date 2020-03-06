import Foundation

public class TopLevelStorage {
    let url = "https://restcountries.eu/rest/v2/all"
    var liN = [String]()
    var liC = [String]()
    
    var correctAnswers: Int = 0
    var totalQuestionsAsked: Int = 0
    var currentQuestionNumber: Int = 0
    public var allQs = [Question]()
    
    init(){
        let restObj = URL(string: url)
        URLSession.shared.dataTask(with: restObj!) { (data, response, error) in
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data!)
                    
                    //print(response)
                    if let httpResponse = response as? HTTPURLResponse {
                        print(httpResponse.statusCode)
                    }
                    for c in countries {
                        if (c.name.starts(with: "Nepal")) {
                            self.allQs.append(Question(statement: ("\(c.name)'s capital is Pokhara."), isTrue: false))
                            
                        }
                        if (c.name.starts(with: "China")) {
                            self.allQs.append(Question(statement: ("\(c.name)'s capital is Shanghai."), isTrue: false))
                        }
                        if (c.name.starts(with: "India")) {
                                                  self.allQs.append(Question(statement: ("\(c.name)'s capital is \(c.capital)."), isTrue: true))
                                              }
                        
                        if (c.name.starts(with: "Bhutan")) {
                            self.allQs.append(Question(statement: ("\(c.name)'s capital is Paro."), isTrue: false))
                        }
                        
                        if (c.name.starts(with: "France")) {
                                                 self.allQs.append(Question(statement: ("\(c.name)'s capital is \(c.capital)."), isTrue: true))
                                             }

                    }
                    //print(self.allQs)
                }catch {
                    print(error)
                }
        }.resume()
    }
    
   public func correctAnswer() -> Void {
        correctAnswers = correctAnswers + 1
        totalQuestionsAsked = totalQuestionsAsked + 1
    }
    
    public func inCorrectAnswer() -> Void {
        totalQuestionsAsked = totalQuestionsAsked + 1
    }
    
    public func totAns() -> Int{
        return correctAnswers
    }
    
    public func currQuestion() -> Int{
        
            return currentQuestionNumber
    }
    
    public func nextQuestionNumber() -> Int {
        
        currentQuestionNumber = (currentQuestionNumber + 1) % allQs.count
        return currentQuestionNumber
    }
    
}
