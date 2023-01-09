import Foundation

import Combine

class ViewModel : ObservableObject {
    // *** Creating array variables for the events and the speakers ***
    @Published var events: [Event] = []
    @Published var speakers: [Speaker] = []
    
    // *** Creating variables in case there was an error when trying to get the events ***
    @Published var isError: Bool = false
    @Published var errorText: String = ""
    
    func fetchEventList() {
        RequestFactory().getEventList { events,error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    self.isError = true
                    self.errorText = error!.description
                    return
                }
                
                // *** if there is no error but the list returned is empty ***
                guard let events = events else {
                    print("We have an empty list here!")
                    return
                }
                
                // *** if there is no error and the events were returned well ***
                self.events = [Event](events).sorted {
                    $0.fields.start < $1.fields.start
                }
            }
        }
    }
    
    func fetchSpeakerByEvent(speakersId: [String]) {
        for speakerId in speakersId {
            RequestFactory().getSpeakerById(speakerId: speakerId) { speaker in
                DispatchQueue.main.async {
                    
                    // *** getting the speaker(s) of an event with their id ***
                    if let speaker = speaker {
                        self.speakers.append(speaker)
                        self.objectWillChange.send()
                    }
                }
            }
        }
    }
}
