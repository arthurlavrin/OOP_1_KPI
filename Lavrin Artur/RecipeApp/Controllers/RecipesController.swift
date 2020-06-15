import UIKit

class RecipesController: UITableViewController {
  var recipes: [Recipe] = []
  
  // MARK: - Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()

    recipes = Recipe.recipesList
  }

  // MARK: - UITableViewDataSource
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
    let recipeItem = recipes[indexPath.row]
    cell.nameLabel.text = recipeItem.title
    cell.descriptionLabel.text = recipeItem.description
    cell.thumbnailImageView.image = UIImage(named: recipeItem.thumbnailName)
    cell.backgroundColor = UIColor.white
    
    return cell
  }
  
  // MARK: - Navigation
  // Реалізація переходу з головного екрану на екран рецепту
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Ключове слово guard використовується для раннього виходу з функції, в разі, якщо якась з умов не виконана
    guard
      let selectedCell = sender as? UITableViewCell,
      let selectedRowIndex = tableView.indexPath(for: selectedCell)?.row, segue.identifier == "showRecipeInfoViewController"
    else {
      // в разі якщо ідентифікатор некоректний, завершити виконання з помилкою
        fatalError("sender is not a UITableViewCell or was not found in the tableView, or segue.identifier is incorrect")
    }
    
    // знайти інформацію про потрібний рецепт за індексом
    let recipe = recipes[selectedRowIndex]
    // перехід на сторінку рецепту
    let detailViewController = segue.destination as! RecipeInfoViewController
    // передача даних конкретного рецепту
    detailViewController.Recipe = recipe
  }
}
