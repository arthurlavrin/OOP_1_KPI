import UIKit

class RecipeInfoViewController: UIViewController {
    // create instance of Recipe
    var Recipe: Recipe!
  
    //Connect graphic element to the code
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var recipeLabel: UILabel!
    @IBOutlet var userRatingLabel: UILabel!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var descriptionLabel: UILabel!
//    @IBOutlet weak var recipeLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set View data
    title = Recipe.title
    titleLabel.text = Recipe.title
    descriptionLabel.text = Recipe.description
    recipeLabel.text = Recipe.recipe
    userRatingLabel.text = String(repeating: "★", count: Recipe.userRating)
  }
}
