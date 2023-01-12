//
//  ContentView.swift
//  RecorderApp
//
//  Created by Rahaf Aldosary on 11/06/1444 AH.
//
import SwiftUI
struct ContentView: View{
    
    
    @State var isVoiceOverPressed = false
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    
    
    
    @State private var animationAquaColor = false
    @State private var animationSkyColor = false
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack(alignment: .center){
      
                    
                    Spacer()
                    
                    
                    
                    Text("Welcome")
                        .font(.custom("MontserratAlternates-Regular", size: 24))
                    
                    
                    
                        .frame(width: 390, height: 140)
                    
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    
                    
                    if audioRecorder.recording == false {
                        Button(action: {print(self.audioRecorder.startRecording())})
                        {
                            ZStack{
                                Circle() //inside
                                    .frame(width: 280, height: 280)
                                    .foregroundColor(Color.pulsatingColor)
                                    .padding(.bottom, 100.0)
                                
                                Circle() //outside
                                    .frame(width: 180,height: 180)
                                    .foregroundColor(Color.outlineColor)
                                    .padding(.bottom, 100.0)
                                
                                Image(systemName: "mic.fill")
                                    .font(.system(size: 55))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 100.0)
                                
                                
                                
                            }
                            
                            
                            //activate voice control
                            .accessibilityLabel("Record")
                            
                            .accessibilityAction {
                                isVoiceOverPressed = true
                            }                        .accessibilityShowsLargeContentViewer()
                            
                        }
                    } else {
                        Button(action: {
                            self.audioRecorder.stopRecording()
                            
                            
                        }) {
                            ZStack{
                                
                                Circle() //inside
                                    .frame(width: 280, height: 280)
                                    .foregroundColor(Color.pulsatingColor)
                                
                                    .scaleEffect(animationSkyColor ? 1 : 0.8)
                                    .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(2))
                                    .padding(.bottom, 100.0)
                                
                                    .onAppear(){
                                        self.animationSkyColor.toggle()
                                        
                                    }
                                Circle() //outside
                                    .frame(width: 200,height: 200)
                                    .foregroundColor(Color.outlineColor)
                                    .scaleEffect(animationSkyColor ? 1 : 0.5)
                                    .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(2))
                                    .padding(.bottom, 100.0)
                                
                                    .onAppear(){
                                        self.animationAquaColor.toggle()
                                    }
                                
                                
                                Image(systemName: "mic.fill")
                                    .font(.system(size: 55))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 100.0)
                                
                                
                                
                                
                            }  .accessibilityLabel("Stop")
                            
                                .accessibilityAction {
                                    isVoiceOverPressed = false
                                }
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                    
                }.padding(.bottom, 130)
                
                VStack{
                    Spacer()
                    
                    Text("Tab")
                        .foregroundColor(.white)
                        .font(.custom("MontserratAlternates-Regular", size: 18))
                        .padding(.top, 470)
                    Spacer()
                    HStack {
                        
                        NavigationLink(destination: RecordingHistory(audioRecorder: AudioRecorder())) {
                            Text("Recordings")
                                .accessibilityLabel("recordings")
                            
                                .accessibilityAction {
                                    isVoiceOverPressed = true
                                }
                                .foregroundColor(.white)
                                .font(.custom("MontserratAlternates-Regular", size: 22))
                                .padding(.leading, 190.0)
                            Image(systemName: "chevron.forward")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                        }
                        
                        
                        
                        
                        
                    }
                }
            }.onAppear(){
                NotificationManagerr.instance.requestAuthorization()
                NotificationManagerr.instance.scheduleNotifications()
                }
            
        }.accentColor(.white)
            .navigationBarHidden(true)
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}

