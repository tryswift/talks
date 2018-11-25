import UIKit

class IntroViewController: UIViewController {
    @IBOutlet weak var introImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gifUrlString = "https://media.giphy.com/media/3ov9kaiuHM39jnVKpO/giphy.gif"
        let gifImage = UIImage.gifImageWithURL(gifUrlString)
        introImageView.image = gifImage
    }
}

