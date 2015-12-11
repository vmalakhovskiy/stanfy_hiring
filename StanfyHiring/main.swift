//
//  main.swift
//  StanfyHiring
//
//  Created by Vitaliy Malakhovskiy on 12/11/15.
//  Copyright © 2015 Vitalii Malakhovskyi. All rights reserved.
//

import Foundation

func shell(command: String) -> String {
    let task = NSTask()
    task.launchPath = "/bin/sh"
    task.arguments = ["-c", command]
    
    let pipe = NSPipe()
    task.standardOutput = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output: String = NSString(data: data, encoding: NSUTF8StringEncoding)! as String
    
    return output
}

print("1 More about Stanfy\n2 What kind of projects we do\n3 Show me Stanfy site\n4 Nice, I’d like to send message and CV")
let input = readLine(stripNewline: true)

switch input {
case .None: break;
case .Some(let text):
    switch text {
    case "1": print("More Stanfy Info")
    case "2":
        shell("open https://stanfy.com/our-work/")
    case "3":
        shell("open https://stanfy.com")
    case "4":
        print("sending...")
        shell("echo something smart | mailx -s \"i want to work!\" agarkavyi@stanfy.com.ua")
        print("sent")
    default: ()
    }
}