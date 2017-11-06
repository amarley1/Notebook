//
//  updateNoteViewController.swift
//  NotebookProj
//
//  Created by Allison Marley on 11/1/17.
//  Copyright © 2017 ASU. All rights reserved.
//
import UIKit

class updateNoteViewController: UIViewController, UITextViewDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var note: Note!
    
    @IBOutlet weak var entryText: UITextView!
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateAction(_ sender: Any) {
        
        guard let newEntry = entryText.text else  {
            return
        }
        
        note.name = newEntry
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        entryText!.delegate = self
        entryText!.becomeFirstResponder()
        configureEntryData(entry: note)
        
        print(note)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func configureEntryData(entry: Note) {
        
        guard let text = entry.name else {
            return
        }
        
        entryText!.text = text
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
}
