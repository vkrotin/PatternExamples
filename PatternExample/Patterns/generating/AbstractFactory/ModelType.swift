//
//  ModelType.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class AppleIphone : GenericIphone {
    
    init() {
        super.init("IPhone", "iOS")
    }
}

class AppleIpad: GenericIPad {
    init() {
        super.init("iPad", "iOS")
    }
}

class FackeIphone : GenericIphone {
    
    init() {
        super.init("Chi Huan Ipado Kill", "Android")
    }
}

class FackeIpad: GenericIPad {
    init() {
        super.init("PodaI", "Windows SE")
    }
}
