//
//  PruebaCeibaiOSTests.swift
//  PruebaCeibaiOSTests
//
//  Created by Usser on 25/09/21.
//

import XCTest
@testable import PruebaCeibaiOS

class PruebaCeibaiOSTests: XCTestCase {

    private var userViewModel: UserViewModel?
    
    override func setUp() {
        userViewModel = UserViewModel(repository: UserRemoteRepository())
    }

    func testUserData() throws {
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
