import UIKit

class WhatsTakingSoLongViewController: UIViewController {
    @IBOutlet weak var surpriseImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gifUrlString = "https://media.giphy.com/media/WuGSL4LFUMQU/giphy.gif"
        let gifImage = UIImage.gifImageWithURL(gifUrlString)
        surpriseImageView.image = gifImage
    }
}
