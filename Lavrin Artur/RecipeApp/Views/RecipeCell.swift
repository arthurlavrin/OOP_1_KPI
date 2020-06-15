import UIKit

class RecipeCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var thumbnailImageView: UIImageView!

  override func awakeFromNib() {
    super.awakeFromNib()

    // 1
    let layoutGuide = UILayoutGuide()
    contentView.addLayoutGuide(layoutGuide)

    // 2
    let topConstraint = layoutGuide.topAnchor
      .constraint(equalTo: nameLabel.topAnchor)

    // 3
    let bottomConstraint = layoutGuide.bottomAnchor
      .constraint(equalTo: descriptionLabel.bottomAnchor)

    // 4
    let centeringConstraint = layoutGuide.centerYAnchor
      .constraint(equalTo: contentView.centerYAnchor)

    // 5
    NSLayoutConstraint.activate(
      [topConstraint, bottomConstraint, centeringConstraint])
  }
}
