//
//  NY_TimesTests.swift
//  NY TimesTests
//
//  Created by Ramesh Guddala on 04/08/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//
import XCTest
@testable import NY_Times

class NY_TimesTests: XCTestCase {
    var mainvc: NY_Times.ViewController!
    private func setUpViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        self.mainvc = (storyboard.instantiateViewController(withIdentifier: "ViewController") as! NY_Times.ViewController) //
        self.mainvc.loadView()
        self.mainvc.viewDidLoad()
    }
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
         self.setUpViewControllers()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         mainvc = nil
        super.tearDown()
    }
    
    func testMainVC() {
        XCTAssertNotNil(self.mainvc, "Main VC is nil")
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDownloadWebData() {
        
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Download apple.com home page")
        
        // Create a URL for a web page to be downloaded.
        let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=C5KhCcr1Uhor6s3PXLZOoItBLDqrzx7G")!
        
        // Create a background task to download the web page.
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            // Make sure we downloaded some data.
            XCTAssertNotNil(data, "No data was downloaded.")
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
            
        }
        
        // Start the download task.
        dataTask.resume()
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
