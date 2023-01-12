import SwiftUI

struct RecordingHistory: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        NavigationView{
            
            ZStack {
                
                
                VStack(spacing: 20) {
                    
                    HStack {



                        NavigationLink(destination: ContentView(audioRecorder: AudioRecorder())) {
                            
                            
                            
//                            Image(systemName: "chevron.backward")
//                                .foregroundColor(.white)
//                                .font(.system(size: 20))





//                            Text("Record")
//                                .foregroundColor(.white)
//                                .font(.custom("MontserratAlternates-Regular", size: 20))
//                                .padding(.trailing, 250)
//                                .navigationBarHidden(true)
                            
                        }

                    }
                    
                    
                    Text("SavedRecordings")
                    .padding(.trailing, 60)
                    .foregroundColor(.white)
                    .font(.custom("MontserratAlternates-Regular", size: 30))
                    
                    
                    
                    
                    RecordingsList(audioRecorder: audioRecorder)
                    
                    Spacer()
                    
                }
                
                
                
            }
            
            .background(Color.backgroundColor)
            
        }
        
            .accentColor(.white)
            
        
        
        
    }
}
struct RecordingHistory_Previews: PreviewProvider {
    static var previews: some View {
        RecordingHistory(audioRecorder: AudioRecorder())
    }
    
}
