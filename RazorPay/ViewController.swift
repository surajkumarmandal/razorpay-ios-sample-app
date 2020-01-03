import UIKit
import Razorpay

class ViewController: UIViewController {
    
    private var razorpay:Razorpay?

    override func viewDidLoad() {
        super.viewDidLoad()
        razorpay = Razorpay.initWithKey("rzp_test_M5SSosZmoX7pg5", andDelegate: self)
    }
    
    
    @IBAction func payButtonTapped(_ sender: Any) {
        
        let options: [String:Any] = [
             "amount" : "1000", //mandatory in paise like:- 1000 paise ==  10 rs
             "description": "This is a demo RazorPay Integration.",
             "image": "ss",
             "name": "Suraj Kumar Mandal",
             "prefill": [
             "contact": "1234567890",
             "email": "demo@gmail.com"
             ],
             "theme": [
                 "color": "#53d6fd"
             ]
         ]
        razorpay?.open(options)
        
    }
    
}

extension ViewController: RazorpayPaymentCompletionProtocol {
    func onPaymentSuccess(_ payment_id: String) {
        let alert = UIAlertController(title: "Paid", message: "Payment Success", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "Error", message: "\(code)\n\(str)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

