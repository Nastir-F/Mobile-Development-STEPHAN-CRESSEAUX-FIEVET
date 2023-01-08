import Foundation

class ViewModel : ObservableObject {
    @Published var events: [Event] = []
    @Published var speakers: [Speaker] = []
    @Published var isError: Bool = false
    @Published var errorText: String = ""
    
    func fetchEventList() {
        RequestFactory().getEventList { events,error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    print(error!.description)
                    self.isError = true
                    self.errorText = error!.description
                    print(self.errorText)
                    return
                }
                
                guard let events = events else {
                    print("We have an empty list here!")
                    return
                }
                
                self.events = [Event](events).sorted {
                    $0.fields.start < $1.fields.start
                }
            }
        }
    }
    
    func fetchSpeakerByEvent(speakersId: [String]) {
        DispatchQueue.main.async {
            for speakerId in speakersId {
                RequestFactory().getSpeakerById(speakerId: speakerId) { speaker in
                    if let speaker = speaker {
                        self.speakers.append(speaker)
                    }
                }
            }
        }
    }
}
