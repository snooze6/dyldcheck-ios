//
//  Security.swift
//  dyldcheck
//
//  Created by Snooze on 26/08/2019.
//  Copyright © 2019 Snooze. All rights reserved.
//

import Foundation
import MachO

func getLibs() -> [String]{
    let nlibs = _dyld_image_count();
    
    var array = [String]()
    for n in 0...(nlibs-1) {
        let name = String(validatingUTF8: _dyld_get_image_name(n)!)!
        array.append(name)
//        NSLog(name)
    }
    return array
}

func getLibNames() -> [String]{
    var ret = [String]()
    for lib in getLibs(){
        ret.append(String(lib.split(separator: "/").last ?? "nil"))
    }
    return ret
}
