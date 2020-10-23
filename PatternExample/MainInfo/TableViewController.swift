//
//  TableViewController.swift
//  PatternExample
//
//  Created by  vkrotin on 19.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    lazy var patterns = PatternManager().displayPatternHashList()

    override func numberOfSections(in tableView: UITableView) -> Int {
        return patterns.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patterns.values(in: section)?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = patterns.value(at: indexPath)?.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return patterns.key(in: section)?.description ?? patterns.key(in: section)?.name
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToDetail", sender: patterns.value(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailController = segue.destination as? DetailViewController, let obj = sender as? Pattern else {
            return
        }
        detailController.pattern = obj
    }
    

}
