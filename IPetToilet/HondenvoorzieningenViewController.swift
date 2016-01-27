//
//  ViewController.swift
//  IPetToilet
//
//  Created by Lesgever on 12/11/14.
//  Copyright (c) 2014 Hogent. All rights reserved.
//

import UIKit

class HondenvoorzieningenViewController: UITableViewController {
    private var voorzieningen: [Hondenvoorziening] = []
    
    override func viewDidLoad() {
        let downloadTask = service.createFetchTask {
            self.voorzieningen = $0
            self.tableView.reloadData()
        }
        downloadTask.resume()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "Overzicht"){
            let hondenvoorzieningOverViewController = segue.destinationViewController as! HondenvoorzieningOverViewViewController
            
            hondenvoorzieningOverViewController.voorzieningen = voorzieningen
        }else{
            let hondenvoorzieningController = segue.destinationViewController as! HondenvoorzieningViewController
            let geselecteerdeVoorziening = voorzieningen[tableView.indexPathForSelectedRow!.row]
            hondenvoorzieningController.voorziening = geselecteerdeVoorziening
        }
        
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voorzieningen.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("voorzieningCell", forIndexPath: indexPath) as UITableViewCell
        let voorziening = voorzieningen[indexPath.row]
        cell.textLabel!.text = voorziening.soort
        cell.detailTextLabel!.text = voorziening.plaatsOmschrijving
        return cell
    }
    
    @IBAction func refresh(sender: UIRefreshControl) {
        let downloadTask = service.createFetchTask {
            self.voorzieningen = $0
            self.tableView.reloadData()
            sender.endRefreshing()
        }
        downloadTask.resume()
    }

}

