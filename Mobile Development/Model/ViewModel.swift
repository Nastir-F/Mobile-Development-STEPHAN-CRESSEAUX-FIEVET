import Foundation

class ViewModel : ObservableObject {
    @Published var events: [Event] = []
    @Published var speakers: [Speaker] = []
    
    
    init() {
        self.fetchEvent()
    }
    
    func fetchEvent() {
        RequestFactory().getEventList { events in
            if let events = events {
                self.events = [Event](events).sorted {
                        $0.fields.start < $1.fields.start
                    }
            }
        }
    }
    
    func fetchSpeakerByEvent(speakersId: [String]) {
        for speakerId in speakersId {
            RequestFactory().getSpeakerById(speakerId: speakerId) { speaker in
                if let speaker = speaker {
                    self.speakers.append(speaker)
                }
            }
        }
    }
}
