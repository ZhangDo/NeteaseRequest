import XCTest
@testable import NeteaseRequest

final class NeteaseRequestTests: XCTestCase {
    func testExample() async {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        do {
            let newSongs:[NewSongs] = try await getNewSons()
            print(newSongs.first!.name)
            
        } catch {
            print(error)
        }

        
    }
    
    
    func getNewSons() async throws ->  [NewSongs] {
        return try await NeteaseRequest.request(url: NeteaseRequest.EndPoint.newsong, parameters: [:], dataObj: "result")
    }
    
    
}
