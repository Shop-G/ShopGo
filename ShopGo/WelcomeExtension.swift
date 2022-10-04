
import UIKit

extension UIViewController {
   static var identifier: String {
       return String(describing: self)
   }
   static func instantiate() -> Self {
       let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
       return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
   }
    static var identifierAccount: String {
        return String(describing: self)
    }
    static func instantiateAccount() -> Self {
        let storyboard = UIStoryboard(name: "CreateAccountScreen", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifierAccount) as! Self
    }
    static var identifierLogIn: String {
        return String(describing: self)
    }
    static func instantiateLogIn() -> Self {
        let storyboard = UIStoryboard(name: "LoginScreen", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifierLogIn) as! Self
    }
}

