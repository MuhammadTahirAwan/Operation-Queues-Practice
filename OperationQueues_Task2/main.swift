//
//  main.swift
//  OperationQueues_Task2
//
//  Created by Tahir Awan on 02/11/2026.
//

import Foundation

class OperationManager{
    
    
    let customQueue: OperationQueue = {
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 2
//        queue.maxConcurrentOperationCount = 6
        
        return queue
    }()
    
    
    func createOperation(opName: String) -> BlockOperation{
        
        return BlockOperation{
            
            print("Operation \"\(opName)\" started") //  here use A, B, C, D depending on which operation you are configuring
            for _ in 0..<1000000 {
                // do nothing
            }
            print("Operation \"\(opName)\" finished") //  here use A, B, C, D depending on which operation you are configuring
        }
        
    }
    
    
    func testCustomQueue() {
        
        let opr1 = createOperation(opName: "A")
//        opr1.queuePriority = .low
//        customQueue.addOperation(opr1)
        
        let opr2 = createOperation(opName: "B")
//        customQueue.addOperation(opr2)
        
        let opr3 = createOperation(opName: "C")
//        customQueue.addOperation(opr3)
        
        let opr4 = createOperation(opName: "D")
//        customQueue.addOperation(opr4)
        
        let opr5 = createOperation(opName: "E")
//        customQueue.addOperation(opr5)
        
        let opr6 = createOperation(opName: "F")
//        customQueue.addOperation(opr6)
        
        
        opr2.addDependency(opr3)
        opr4.addDependency(opr2)
        
        customQueue.addOperations([opr1, opr2, opr3, opr4, opr5, opr6], waitUntilFinished: true)
        customQueue.waitUntilAllOperationsAreFinished()
    }
    
}


let runner = OperationManager()

runner.testCustomQueue()
