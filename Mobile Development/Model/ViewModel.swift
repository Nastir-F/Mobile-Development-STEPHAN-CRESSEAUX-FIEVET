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
    func fetchSpeaker() {
        RequestFactory().getSpeakerList { speakers in
            if let speakers = speakers {
                DispatchQueue.main.async {
                    self.speakers = [Speaker](speakers)
                }
            } else {
                print("les speakers n'ont pas été récupérés")
            }
        }
    }
}
