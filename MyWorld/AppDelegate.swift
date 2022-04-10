//
//  AppDelegate.swift
//  MyWorld
//
//  Created by user143594 on 11/11/18.
//  Copyright © 2018 user143594. All rights reserved.
//
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application:UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let manager = PlaceManager.shared
        
        
        //Saving data
        let docsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filePath = docsPath.appendingPathComponent("places.json")
        let fileManager = FileManager.default
        
        //------------Treure la linia fora de l'if per ressetejar les dades
        //if !(fileManager.fileExists(atPath: filePath.path)){
            //If don't exist the file, we create it with test information.
            manager.saveJsonToFile(origin: manager.someTestPlaces)
        //}
        
        
        //Load data
        do{
            let jasonData = try Data(contentsOf: filePath)
            let places = manager.placesFrom(jsonData: jasonData)

            for place in places{
                manager.append(place)
            }
            
        } catch {
            print ("Error saving to local file")
        }
        
        return true
    }
}
