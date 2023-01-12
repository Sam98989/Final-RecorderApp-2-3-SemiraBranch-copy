//
//  SplashScreen.swift
//  RecorderApp
//
//  Created by Rahaf Aldosary on 17/06/1444 AH.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var size = 0.9
    @State private var opacity = 0.5
    @State private var show: Bool = false
    @State private var bouncing = false

    var body: some View {
        
        if isActive {
            ContentView(audioRecorder: AudioRecorder())
        } else {
        
            ZStack {
                Color.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack {
                        
                        
                        Text("MobiDiary")
                            .padding(.top, 400)
                            .font(.custom("MontserratAlternates-Regular", size: 30))
                            .foregroundColor(.white)
                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear(){
                        withAnimation(.easeIn(duration: 1.6)){
                            
                            self.size = 1.1
                            self.opacity = 1
                            
                            
                            
                        }
                        
                    }
                    Image("sss")
                        .resizable()
                        .frame(width: 400,height: 400)
                }
                
                
                Image("moon")
                    .resizable()
                    .frame(width: 400,height: 400)
                                .frame(maxHeight: 15, alignment: bouncing ? .top: .bottom)
                    .animation(Animation.easeIn(duration: 2.0))
                    .onAppear{
                        self.bouncing.toggle()
                    }
                
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
                        self.isActive = true

                    }
                }
                
                
             
               
                
                
            }
          
           

            
            
        

        }
        
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
