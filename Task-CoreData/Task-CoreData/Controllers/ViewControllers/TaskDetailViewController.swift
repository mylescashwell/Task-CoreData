//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Myles Cashwell on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty,
              let taskNotes = taskNotesTextView.text else { return }
        if let task = task {
            task.name = taskName
            task.notes = taskNotes
            TaskController.shared.update(task: task, name: taskName, notes: taskNotes, dueDate: taskDueDatePicker.date)
        } else {
            TaskController.shared.createTaskWith(name: taskName, notes: taskNotes, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    
    //MARK: - Functions
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        if let dueDate = task.dueDate {
            taskDueDatePicker.date = dueDate
        }
    }
}
