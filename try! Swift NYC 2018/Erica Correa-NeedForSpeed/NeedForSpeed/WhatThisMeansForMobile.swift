import UIKit

class WhatThisMeansForMobile: UIViewController {
    @IBOutlet weak var angryPhoneImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gifUrlString = "https://media.giphy.com/media/xTiTnzvzlEj5vD3Tkk/giphy.gif"
        let gifImage = UIImage.gifImageWithURL(gifUrlString)
        angryPhoneImageView.image = gifImage
    }
}
