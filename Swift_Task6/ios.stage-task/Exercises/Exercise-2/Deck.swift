import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {
    
    //MARK: - Properties
    
    var cards = [Card]()
    var type: DeckType
    var trump: Suit?
    
    var total:Int {
        return type.rawValue
    }
}

extension Deck {
    
    init(with type: DeckType) {
        self.type = type
        self.cards = createDeck(suits: Suit.allCases, values: Value.allCases)

    }
    
    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var resultCards = [Card]()
        
        for cardSuit in Suit.allCases {
            
            for cardValue in Value.allCases {
                
                let card = Card(suit: cardSuit, value: cardValue)
                
                resultCards.append(card)
            }
            
        }
        
        return resultCards
    }
    
    public mutating func shuffle() {
        cards.shuffle()
    }
    
    public mutating func defineTrump() {
        self.trump = self.cards.first!.suit
        
        for  card in 0..<cards.count {
            if cards[card].suit == trump {
                cards[card].isTrump = true
            }
        }
    }
    
    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for i in  0..<players.count {
            let cards = self.cards[0..<6]
            self.cards.removeSubrange(0..<6)
            
            players[i].hand = []
            players[i].hand?.append(contentsOf: cards)
        }
    }
    
    public func setTrumpCards(for suit:Suit) {
        
    }
}

