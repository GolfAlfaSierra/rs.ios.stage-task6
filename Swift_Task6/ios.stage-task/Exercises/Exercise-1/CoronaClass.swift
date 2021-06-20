import Foundation

class CoronaClass {
    var seats = [Int]()
    private let seatCap: Int
    
    init(n: Int) {
        self.seatCap = n
    }
    
    func seat() -> Int {
        var result = 0
        let endSeat = seatCap - 1
        if !seats.contains(endSeat) {
            result = endSeat
        }
        if seats.contains(0) {
            var i = 0
            var maxDistanceBetweenTwoSeats = 0
            while i < seats.count - 1 {
                let currentDistance = abs(seats[i + 1] - seats[i]) / 2
                if currentDistance > maxDistanceBetweenTwoSeats {
                    
                    maxDistanceBetweenTwoSeats = currentDistance
                    result = seats[i] + currentDistance
                }
                i += 1
            }
        }
        
        seats.append(result)
        seats.sort()
        return result
    }
    
    func leave(_ p: Int) {
        if seats.contains(p) {
            guard let toRemove = seats.firstIndex(of: p) else {return}
            seats.remove(at: toRemove)
        }
    }
}
