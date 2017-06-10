//
//  ViewController.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 5/18/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bookTitleField: UITextField!
    
    @IBOutlet weak var bookAuthorField: UITextField!
    
    @IBOutlet weak var copiesField: UITextField!
    
    @IBOutlet weak var imageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // This sumbits the book into the database.
    @IBAction func submit(_ sender: Any) {
        var newBook: Books?
        
        if let title = bookTitleField.text, let author = bookAuthorField.text,
            let number = copiesField.text, let image = imageField.text{
            
            newBook = Books(newTitle: title as NSString, newAuthor: author as NSString, newNumber: Int(number)! as NSNumber)
            newBook?.setImageUrl(url: image as NSString)
            
            newBook?.submitBook()
            
            self.clearTextFields()
        }
    }
    
    // This clears the textfields in the code.
    fileprivate func clearTextFields() -> Void {
        bookAuthorField.text = ""
        copiesField.text = ""
        imageField.text = ""
        bookTitleField.text = ""
    }
    


}

