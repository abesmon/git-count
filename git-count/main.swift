//
//  main.swift
//  git-count
//
//  Created by Лысенко Алексей Димитриевич on 25.11.2019.
//  Copyright © 2019 Alexey Lysenko. All rights reserved.
//

import Foundation

func start() {
    guard let currentDirectory = CommandLine.arguments.first,
        let commitHash = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : nil else {
            print(CommandLine.arguments)
            return
    }
    
    print("counting for hash: \(commitHash) ...")
    print("here:")
    shell("xcrun", "git", "rev-list", "--count", commitHash)
}

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

start()
