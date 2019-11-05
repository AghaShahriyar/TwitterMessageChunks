//
//  MessageSplitModel.swift
//  Twitter_Message_Split
//
//  Created by Agha Shahriyar Khan on 04/11/2019.
//  Copyright © 2019 Agha Shahriyar Khan. All rights reserved.
//

struct Chunks {
    var chunk : String
}

extension Chunks : Equatable {
    
    init(chunk:String,totalCount:Int,currentCount:Int) {
        self.chunk = "\(currentCount)/\(totalCount) \(chunk)"
    }
    
}

class MessageSplitModel {
    
    func splitBy(message: String, length: Int) -> [Chunks] {
         var count = 0
         var startIndex = message.startIndex
         var results = [Substring]()
         while startIndex < message.endIndex {
            let endIndex = message.index(startIndex, offsetBy: length, limitedBy: message.endIndex) ?? message.endIndex
               if ((message[startIndex..<endIndex].rangeOfCharacter(from: .whitespaces)) == nil) && message[startIndex..<endIndex].count == length {
                 return [Chunks.init(chunk: "")]
               } else {
                 results.append(message[startIndex..<endIndex])
                 startIndex = endIndex
             }
         }
         return results.map { element -> Chunks in
             count+=1
             return Chunks.init(chunk: String(element), totalCount: results.count, currentCount: count)
         }
     }
}
