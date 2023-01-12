//
//  test.swift
//  RecorderApp
//
//  Created by Rahaf Aldosary on 17/06/1444 AH.
//

import SwiftUI

struct test: View {
    @State private var bouncing = false
    var body: some View {
        
        Image("moon")
            .frame(maxHeight: .infinity, alignment: bouncing ? .top: .bottom)
            .animation(Animation.easeIn(duration: 2.0))
            .onAppear{
                self.bouncing.toggle()
            }    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
