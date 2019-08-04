//
//  DetailViewControllerTest.swift
//  NY TimesTests
//
//  Created by Ramesh Guddala on 04/08/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import XCTest
@testable import NY_Times

class DetailViewControllerTest: XCTestCase {
  var detailVC: NY_Times.DetailViewController!
    
    private func setUpViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        self.detailVC = (storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! NY_Times.DetailViewController) //
        self.detailVC.loadView()
        self.detailVC.viewDidLoad()
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         self.setUpViewControllers()
    }
    func testMainVC() {
        XCTAssertNotNil(self.detailVC, "Detail VC is nil")
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         detailVC = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
