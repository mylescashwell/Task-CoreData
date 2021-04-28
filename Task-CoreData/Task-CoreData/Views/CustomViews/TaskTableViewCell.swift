//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Myles Cashwell on 4/27/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ cell: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    
    //MARK: - Properties
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: TaskCompletionDelegate?
    
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        delegate?.taskCellButtonTapped(self)
    }
    
    
    //MARK: - Functions
    func updateViews() {
        guard let task = task else { return }
        taskNameLabel.text = task.name
        let image = task.isComplete ? UIImage(named: "complete") : UIImage(named: "incomplete")
        completionButton.setBackgroundImage(image, for: .normal)
    }
}
