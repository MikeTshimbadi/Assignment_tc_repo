//
//  ViewController.swift
//  ToDo
//
//  Created by Mike Tshimbadi on 5/20/25.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var enterNotes: UITextField!
    
    var notesList: [Notes] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        loadNotes()
    }

    @IBAction func saveClickButton(_ sender: Any) {
        guard let text = enterNotes.text, !text.isEmpty else { return }
        saveNotes(note: text)
        enterNotes.text = ""
        tableView.reloadData()
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NotesTableViewCell
        
        
        let notesInput = notesList[indexPath.row]
        cell?.noteLabel.text = notesInput.note
        
        if let date = notesInput.date {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            cell?.dateLabel.text = formatter.string(from: date)
        }
        
        return cell ?? UITableViewCell()
    }
    
    func loadNotes() {
        
        let fetchRequest = Notes.fetchRequest()
        let moc = CoreDataManager.shared.persistentContainer.viewContext
        do {
            notesList = try  moc.fetch(fetchRequest)
        } catch {
            print("❌ Failed to fetch notes:", error)
        }
        
    }
    
    func saveNotes(note: String) {
        let moc = CoreDataManager.shared.persistentContainer.viewContext
        let notesText = Notes(context: moc)
        notesText.note = note
        notesText.date = Date()
        CoreDataManager.shared.saveContext()
        loadNotes()
    }

}

