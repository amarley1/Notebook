//
//  addNoteViewController.swift
//  NotebookProj
//
//  Created by Allison Marley on 11/1/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class addNoteViewController: UIViewController, UITextViewDelegate {
    
    
    
    @IBOutlet var itemEntryTextView: UITextView?
    
   
    
    @IBAction func saveNote(_ sender: Any) {
    
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newNote = Note(context: context)
            newNote.name =  itemEntryTextView?.text!
            
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            dismiss(animated: true, completion: nil)
            
        }
        
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemEntryTextView?.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
 
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
   
    
}
