import UIKit

class HoorayViewController: UIViewController {
    @IBOutlet weak var celebrateImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gifUrlString = "https://media.giphy.com/media/gFO9r8HaXFgfS/giphy.gif"
        let gifImage = UIImage.gifImageWithURL(gifUrlString)
        celebrateImageView.image = gifImage
    }
}
