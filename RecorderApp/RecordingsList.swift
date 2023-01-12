//
//  RecordingsList.swift
//  RecorderApp
//
//  Created by Samira Omer on 08/01/2023.
//

import SwiftUI



struct RecordingsList: View {
    @State private var searchText = ""
    
    @ObservedObject var audioRecorder: AudioRecorder
    @State private var search: String = ""
    var colors: [Color] = [.rec1, .rec2, .rec3]

    var body: some View {
        NavigationView{
            ZStack{
                
                
                VStack(){

                    List {
                        ForEach(audioRecorder.recordings
                                
                                , id: \.createdAt)
                        { recording in
                            RecordingRow(audioURL: recording.fileURL)
                        }
                        .onDelete(perform: delete)
                        .listRowSeparator(.hidden, edges: .bottom).foregroundColor(.white)

                        
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 20)
                                .background(.clear)
                                .foregroundColor(colors.randomElement())
                                .frame(height: 130)
                                .padding(
                                    EdgeInsets(
                                        top: 9,
                                        leading: 3,
                                        bottom: 9,
                                        trailing: 3
                                    )
                                )
                        )
                        
                    }.listRowBackground(colors.randomElement())
                    .padding(.horizontal, 20.0)
                    .listStyle(.plain)
                    .listRowInsets(.init(top: 9, leading: 6, bottom: 0, trailing: 0)).environment(\.defaultMinListRowHeight, 150)
           
                    
                    
                }.navigationBarHidden(true)
                .navigationBarTitle("My Recordings")
                    .background(Color("myblue"))
                
                
                   
               
            }
        }
        
    }


               
        
        
    
    
    func delete(at offsets: IndexSet) {
        
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
}


struct RecordingRow: View {
    @State var textfieldText: String = ""
    @State var dataArray: [String] = []
    
    var audioURL: URL
    
    @ObservedObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        ZStack{
           
            HStack {
                
                Text("\(audioURL.lastPathComponent)")
                Spacer()
                if audioPlayer.isPlaying == false {
                    Button(action: {
                        self.audioPlayer.startPlayback(audio: self.audioURL)
                    }) {
                        Image(systemName: "play.circle")
                            .imageScale(.large)
                    }
                } else {
                    Button(action: {
                        self.audioPlayer.stopPlayback()
                    }) {
                        Image(systemName: "stop.fill")
                            .imageScale(.large)
                    }
                }
            }
            
            
        }
    }
    func saveText(){
        dataArray.append(textfieldText)
        textfieldText = ""
    }
}
//struct SearchAndScanView: View {
//    @Binding var search: String
//    var body: some View {
//        HStack {
//
//            HStack {
//                Image(systemName: "magnifyingglass")
//                TextField("Search", text: $search)
//            }
//            .foregroundColor(.gray)
//            .padding(.all, 10)
//            .background(.white)
//            .cornerRadius(10.0)
//            .padding(.trailing, 8)
//            .padding(.leading, 8)
//
//
//        }
//        .padding(.horizontal)
//    }
//}

struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsList(audioRecorder: AudioRecorder())
    }
}
