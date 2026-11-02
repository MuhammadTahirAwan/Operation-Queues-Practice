//
//  main.swift
//  OperationQueues_Task3
//
//  Created by Tahir Awan on 02/11/2026.
//

import Foundation

class OperationManager2{
    
    
    let customQueue: OperationQueue = {
        
        let queue = OperationQueue()
        //        queue.maxConcurrentOperationCount = 6
        
        return queue
    }()
    
    var opr1: BlockOperation?
    var opr2: BlockOperation?
    
    func createOperation(opName: String) -> BlockOperation{
        
        return BlockOperation{ [weak self] in
            
            print("Operation \"\(opName)\" started")
            
            self?.opr2?.cancel()
            
            for _ in 0..<1000000 {
                // do nothing
            }
            print("Operation \"\(opName)\" finished")
            
        }
        
    }
    
    
    func testCustomQueue() {
        
        opr1 = createOperation(opName: "A")
        opr2 = createOperation(opName: "B")
        
//        opr2!.addDependency(opr1!)
        
        customQueue.addOperations([opr1!, opr2!], waitUntilFinished: true)
//        customQueue.waitUntilAllOperationsAreFinished()
    }
    
}


let runner = OperationManager2()

runner.testCustomQueue()
