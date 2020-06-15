import Foundation

struct Recipe {
  let identifier: Int
  let thumbnailName: String
  
  let title: String
  let recipe: String
  let description: String
  let userRating: Int
}

// MARK: - Support for loading data from plist

extension Recipe {
   static var recipesList: [Recipe] = {
    return loadRecipesFromPlistNamed("recipes")
  }()
  
  static func loadRecipesFromPlistNamed(_ plistName: String) -> [Recipe] {
    guard
      let path = Bundle.main.path(forResource: plistName, ofType: "plist"),
      let dictArray = NSArray(contentsOfFile: path) as? [[String : AnyObject]]
      else {
        fatalError("An error occurred while reading \(plistName).plist")
    }
    
    var recipeItems: [Recipe] = []
    
    for dict in dictArray {
      guard
        let identifier    = dict["identifier"]    as? Int,
        let thumbnailName = dict["thumbnailName"] as? String,
        let title         = dict["title"]         as? String,
        let recipe        = dict["recipe"]        as? String,
        let description   = dict["description"]   as? String,
        let userRating    = dict["userRating"]    as? Int
        else {
          fatalError("Error parsing dict \(dict)")
      }
      
      let item = Recipe(
        identifier: identifier,
        thumbnailName: thumbnailName,
        title: title,
        recipe: recipe,
        description: description,
        userRating: userRating
      )
      
      recipeItems.append(item)
    }
    
    return recipeItems
  }
}
