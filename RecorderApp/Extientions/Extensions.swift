//
//  Extensions.swift
//  RecorderApp
//
//  Created by Rahaf Aldosary on 11/06/1444 AH.
//

import Foundation

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}

