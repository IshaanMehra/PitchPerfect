//
//  RecordAudio.swift
//  Pitch perfect
//
//  Created by Ishaan Mehra on 12/03/16.
//  Copyright © 2016 Ishaan Mehra. All rights reserved.
//

import Foundation

class RecordAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    init(filePathUrl: NSURL, title: String){
        self.filePathUrl = filePathUrl
        self.title = title
    }
}