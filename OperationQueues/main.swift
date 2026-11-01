//
//  main.swift
//  OperationQueues
//
//  Created by Tahir Awan on 01/11/2026.
//

import Foundation

class OperationRunner {
    
    let customQueue = OperationQueue()
    
    
    func createOperation() -> BlockOperation{
        
        return BlockOperation{
            
            print("Operation \"A\" started")
            for _ in 0..<1000000 {
                // do nothing
            }
            print("Operation \"A\" finished")
        }
    }
    
    
    
    
    func testCustomQueue() {
        customQueue.addOperation(createOperation())
        customQueue.waitUntilAllOperationsAreFinished()
    }
    
    func testMainQueue() {
        OperationQueue.main.addOperation(createOperation())
        
        // Pump the main run loop briefly so the main thread processes the queued operation
        RunLoop.main.run(until: Date().addingTimeInterval(1.0))
    }
    
}


let runner = OperationRunner()


runner.testCustomQueue()
runner.testMainQueue()
