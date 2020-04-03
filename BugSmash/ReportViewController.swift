//
//  ReportViewController.swift
//  BugSmash
//
//  Created by Lachy Schumacher on 1/1/20.
//  Copyright © 2020 Tydewest. All rights reserved.
//

import UIKit
import SystemConfiguration

class ReportViewController: UIViewController {
    
    var FirstnameTextFieldLabel : UILabel = {
        var FTFL = UILabel()
        FTFL.translatesAutoresizingMaskIntoConstraints = false
        FTFL.font = UIFont(name: "HelveticaNeue", size: 15)
        FTFL.text = "FIRST NAME:"
        FTFL.textColor = .darkGray
        FTFL.textAlignment = .natural
        return FTFL
    }()
    var FirstnameTextField : UITextView = {
        var FTF = UITextView()
        FTF.translatesAutoresizingMaskIntoConstraints = false
        FTF.isUserInteractionEnabled = true
        FTF.isEditable = true
        FTF.layer.borderWidth = CGFloat.init(1)
        FTF.layer.cornerRadius = CGFloat.init(7.5)
        FTF.layer.masksToBounds = true
        FTF.font = UIFont(name: "HelveticaNeue", size: 20)
        FTF.keyboardType = .default
        FTF.keyboardAppearance = .dark
        return FTF
    }()
    
    var EmailTextFieldLabel : UILabel = {
        var ETFL = UILabel()
        ETFL.translatesAutoresizingMaskIntoConstraints = false
        ETFL.font = UIFont(name: "HelveticaNeue", size: 15)
        ETFL.text = "EMAIL ADDRESS:"
        ETFL.textColor = .darkGray
        ETFL.textAlignment = .natural
        return ETFL
    }()
    
    var EmailTextField : UITextView = {
        var ETF = UITextView()
        ETF.translatesAutoresizingMaskIntoConstraints = false
        ETF.isUserInteractionEnabled = true
        ETF.isEditable = true
        ETF.layer.borderColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        ETF.layer.borderWidth = CGFloat.init(1)
        ETF.layer.cornerRadius = CGFloat.init(7.5)
        ETF.layer.masksToBounds = true
        ETF.font = UIFont(name: "HelveticaNeue", size: 20)
        ETF.keyboardType = .emailAddress
        ETF.keyboardAppearance = .dark
        return ETF
    }()
    var SubjectTextFieldLabel : UILabel = {
        var STFL = UILabel()
        STFL.translatesAutoresizingMaskIntoConstraints = false
        STFL.font = UIFont(name: "HelveticaNeue", size: 15)
        STFL.text = "SUBJECT:"
        STFL.textColor = .darkGray
        STFL.textAlignment = .natural
        return STFL
    }()
    var SubjectTextField : UITextView = {
        var STF = UITextView()
        STF.translatesAutoresizingMaskIntoConstraints = false
        STF.isUserInteractionEnabled = true
        STF.isEditable = true
        STF.layer.borderColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        STF.layer.borderWidth = CGFloat.init(1)
        STF.layer.cornerRadius = CGFloat.init(7.5)
        STF.layer.masksToBounds = true
        STF.font = UIFont(name: "HelveticaNeue", size: 20)
        STF.keyboardType = .default
        STF.keyboardAppearance = .dark
        return STF
    }()
    var DetailsTextFieldLabel : UILabel = {
        var DTFL = UILabel()
        DTFL.translatesAutoresizingMaskIntoConstraints = false
        DTFL.font = UIFont(name: "HelveticaNeue", size: 15)
        DTFL.text = "DETAILS:"
        DTFL.textColor = .darkGray
        DTFL.textAlignment = .natural
        return DTFL
    }()
    var DetailsTextField : UITextView = {
        var DTF = UITextView()
        DTF.translatesAutoresizingMaskIntoConstraints = false
        DTF.isUserInteractionEnabled = true
        DTF.isEditable = true
        DTF.layer.borderWidth = CGFloat.init(1)
        DTF.layer.cornerRadius = CGFloat.init(7.5)
        DTF.layer.masksToBounds = true
        DTF.font = UIFont(name: "HelveticaNeue", size: 15)
        DTF.keyboardType = .default
        DTF.keyboardAppearance = .dark
        return DTF
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupView()
        view.addSubview(FirstnameTextFieldLabel)
        view.addSubview(FirstnameTextField)
        view.addSubview(EmailTextFieldLabel)
        view.addSubview(EmailTextField)
        view.addSubview(SubjectTextFieldLabel)
        view.addSubview(SubjectTextField)
        view.addSubview(DetailsTextFieldLabel)
        view.addSubview(DetailsTextField)
        view.layoutIfNeeded()
        setupLayout()
        
        
    }
    func setupView() {
        view.backgroundColor = .systemBackground
        overrideUserInterfaceStyle = .light
    }
    func setupNavBar() {
        navigationItem.title = "Smash The Bug"
        let titleFont = [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue", size: 20)!]
        navigationController?.navigationBar.titleTextAttributes = titleFont
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        let UploadIncidentFormButton = UIBarButtonItem(image: UIImage(systemName: "checkmark.square"), style: .plain, target: self, action: #selector(UploadIncidentForm))
        self.navigationItem.rightBarButtonItem = UploadIncidentFormButton
    }
    @objc func UploadIncidentForm() {
        dismiss(animated: true, completion: nil)
        PrivacyConsentAlert()
    }
    func PrivacyConsentAlert() {
        let alertController = UIAlertController(title: "Privacy Consent", message: "Do You Consent To The Data You Provided Being Stored In Accordance With The BugSmash Privacy Policy" , preferredStyle: .alert)
        //We add buttons to the alert controller by creating UIAlertActions:
        let Decline = UIAlertAction(title: "Decline", style: .destructive, handler: nil)
        let Agree = UIAlertAction(title: "Agree", style: .default, handler: { action in
            self.Submit()
        })

        alertController.addAction(Decline)
        alertController.addAction(Agree)
        self.present(alertController, animated: true, completion: nil)
    }
    func GetIP() -> String {
           var publicIP = ""
           do {
               try publicIP = String(contentsOf: URL(string: "https://ip.webstax.io")!, encoding: String.Encoding.utf8)
               publicIP = publicIP.trimmingCharacters(in: CharacterSet.whitespaces)
           }
           catch {
               print("Error: \(error)")
           }
           return publicIP
    }
    func Submit() {
        let request = NSMutableURLRequest(url: NSURL(string: "https://your.Sever.com/UploadReport.php")! as URL)
        request.httpMethod = "POST"
        let postString = "FirstName=\(FirstnameTextField.text!)&Email=\(EmailTextField.text!)&Subject=\(SubjectTextField.text!)&Details=\(DetailsTextField.text!)&Device=\(UIDevice.modelName)&OSVersion=\(UIDevice.current.systemVersion)&AppName=\(Bundle.main.AppName)&AppVersion=\(Bundle.main.VersionNumber)&BuildNumber=\(Bundle.main.BuildNumber)&IP=\(GetIP())"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest){data, response, error in
            guard error == nil && data != nil else{
                print("error")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200{
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            }
            task.resume()
    }
    
    private func setupLayout() {
        
        FirstnameTextFieldLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        FirstnameTextFieldLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        FirstnameTextFieldLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        FirstnameTextFieldLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        FirstnameTextField.topAnchor.constraint(equalTo: FirstnameTextFieldLabel.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        FirstnameTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        FirstnameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        FirstnameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        EmailTextFieldLabel.topAnchor.constraint(equalTo: FirstnameTextField.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        EmailTextFieldLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        EmailTextFieldLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        EmailTextFieldLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        EmailTextField.topAnchor.constraint(equalTo: EmailTextFieldLabel.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        EmailTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        EmailTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        EmailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        SubjectTextFieldLabel.topAnchor.constraint(equalTo: EmailTextField.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        SubjectTextFieldLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        SubjectTextFieldLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        SubjectTextFieldLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        SubjectTextField.topAnchor.constraint(equalTo: SubjectTextFieldLabel.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        SubjectTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        SubjectTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        SubjectTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        DetailsTextFieldLabel.topAnchor.constraint(equalTo: SubjectTextField.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        DetailsTextFieldLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        DetailsTextFieldLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        DetailsTextFieldLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        DetailsTextField.topAnchor.constraint(equalTo: DetailsTextFieldLabel.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        DetailsTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        DetailsTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        DetailsTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -15).isActive = true
    }
}
extension UIDevice {
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
    }
    
    func mapToDevice(identifier: String) -> String {
      #if os(iOS)
        switch identifier {
            //iPod
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            //iPhone
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPhone11,2":                              return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
            case "iPhone11,8":                              return "iPhone XR"
            case "iPhone12,1":                              return "iPhone 11"
            case "iPhone12,3":                              return "iPhone 11 Pro"
            case "iPhone12,5":                              return "iPhone 11 Pro Max"
            //iPad
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
            //Simulator
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default: return identifier
            
            }
      #endif
    }
    
    return mapToDevice(identifier: identifier)
  }()
}
extension Bundle {

    var AppName: String {
        return infoDictionary?["CFBundleName"] as! String
    }
    var VersionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }
    var BuildNumber: String {
        return infoDictionary?["CFBundleVersion"] as! String
    }

}
