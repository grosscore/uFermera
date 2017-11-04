import UIKit
import Siesta

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var photo: RemoteImageView?
    
    var product: Product? {
        didSet {
            name.text = product?.name
            price.text = "\(product?.price ?? "") \(product?.currency ?? "у.е") за \(product?.unit ?? "")"
            location.text = product?.location
            photo?.imageURL = product?.thumbnailPhotoURL
            
            photo?.placeholderImage = UIImage(named: "nophoto")
            photo?.clipsToBounds = true
            photo?.layer.cornerRadius = 10
            photo?.layer.borderWidth = 0.5
            photo?.layer.borderColor = UIColor.lightGray.cgColor
            
            price.text = price.text?.replacingOccurrences(of: ".00", with: "")
        }
    }

}
