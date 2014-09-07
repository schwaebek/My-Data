//
//  ViewController.swift
//  My Data
//
//  Created by Katlyn Schwaebe on 9/2/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appD = UIApplication.sharedApplication().delegate as AppDelegate
        
        var entity = NSEntityDescription.entityForName("Post", inManagedObjectContext: appD.managedObjectContext)
        
        var postObject = NSEntityDescription.insertNewObjectForEntityForName("Post", inManagedObjectContext: appD.managedObjectContext) as NSManagedObject
        
        postObject.setValue("jo@theironyard.com", forKey: "user")
        postObject.setValue("this is a cool title", forKey: "title")
        appD.saveContext()

        //// fetch
        var fetchRequest = NSFetchRequest()
        
        fetchRequest.entity = entity
        var predicate = NSPredicate(format: "user = 'jo@theironyard.com'")
        fetchRequest.predicate = predicate
        var sortDescriptor = NSSortDescriptor(key: "posted_at", ascending:true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        var fetchedObjects = appD.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil)
        println(fetchedObjects)
        
    }
    
        //core data fetch for transfer in objective c
        
//        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//NSEntityDescription *entity = [NSEntityDescription entityForName:@"<#Entity name#>" inManagedObjectContext:<#context#>];
//[fetchRequest setEntity:entity];
//// Specify criteria for filtering which objects to fetch
//NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#format string#>", <#arguments#>];
//[fetchRequest setPredicate:predicate];
//// Specify how the fetched objects should be sorted
//NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"<#key#>"
//ascending:YES];
//[fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
//
//NSError *error = nil;
//NSArray *fetchedObjects = [<#context#> executeFetchRequest:fetchRequest error:&error];
//if (fetchedObjects == nil) {
//    <#Error handling code#>
//}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

