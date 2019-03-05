import XCTest
@testable import HSCryptoX11

class CryptoX11Tests: XCTestCase {
    
    func testJHValue() {
        let data = "DASH".data(using: .utf8)!
        let hash = Data(hex: "9999b3770256821e3a74c780ada66013df52378103addef0bceaac4be4f889d5ff93dc99d654310cc0063f15baa4ab168a2d8b6301104905619c334a92f521a1")!
        XCTAssertEqual(CryptoX11.jh512(from: data), hash)
    }
    
    func testBmw512Value() {
        let data = "DASH".data(using: .utf8)!
        let hash = Data(hex: "4146f08952d34cb498486dc0a063939d7f7be69ede232f379f93c08091ea6d13d6ebdb4e06fe24030f7ca9ac07b8f59e5cfadbb05bded3b9bb3a9abecea031cb")!
        XCTAssertEqual(CryptoX11.bmw512(from: data), hash)
    }
    
    func testEcho512Value() {
        let data = "DASH".data(using: .utf8)!
        let hash = Data(hex: "42a2ee2bb582f59d1be01e4a24ed31041aa1898a3c6c2efe6956e5c6b9eb33d4a9f390f6eccdb7c757d4cb6ad3d3aed302d97740fdf78f569f599ab8cd71ff49")!
        XCTAssertEqual(CryptoX11.echo512(from: data), hash)
    }
    
    func testSimdEmpty() {
        let data = Data(hex: "")!
        let hash = Data(hex: "51a5af7e243cd9a5989f7792c880c4c3168c3d60c4518725fe5757d1f7a69c6366977eaba7905ce2da5d7cfd07773725f0935b55f3efb954996689a49b6d29e0")!
        XCTAssertEqual(CryptoX11.simd512(from: data), hash)
    }
    
    func testSimdValue() {
        let data = "DASH".data(using: .utf8)!
        let hash = Data(hex: "e736a132375bd8aa02d00ea3ff3f0ef4cb8fbdd0b3cf3d619cf3e270896d2911105dc9bf46c395db98f17601529d24b8fa89a28e75f73da110d91a19c44f8975")!
        XCTAssertEqual(CryptoX11.simd512(from: data), hash)
    }
    
    func testBlakeEmpty() {
        let data = Data(hex: "")!
        let hash = Data(hex: "A8CFBBD73726062DF0C6864DDA65DEFE58EF0CC52A5625090FA17601E1EECD1B628E94F396AE402A00ACC9EAB77B4D4C2E852AAAA25A636D80AF3FC7913EF5B8")!
        XCTAssertEqual(CryptoX11.blake512(from: data), hash)
    }
    
    func testBlakeValue() {
        let data = "The quick brown fox jumps over the lazy dog".data(using: .utf8)!
        let hash = Data(hex: "1F7E26F63B6AD25A0896FD978FD050A1766391D2FD0471A77AFB975E5034B7AD2D9CCF8DFB47ABBBE656E1B82FBC634BA42CE186E8DC5E1CE09A885D41F43451")!
        XCTAssertEqual(CryptoX11.blake512(from: data), hash)
    }
    
    func testLuffaValue() {
        let data = "DASH".data(using: .utf8)!
        let hash = Data(hex: "7181d2550acde547eff499c1d533293f6bf4a0464dd9f2264ff5f35e17bb3238a6f7eb036645119a7575627f65fd74288c9581f6cf8a8df034547900aa86d634")!
        XCTAssertEqual(CryptoX11.luffa512(from: data), hash)
    }
    
    func testSkein512Value() {
        let data = "DASH".data(using: .utf8)!
        let hash = Data(hex: "1db131ba5bc4b3ec9e381a752b3f0d53e8dd25e3d22aa8b9f17b570c3b5938833b91a54939ba873d28483e8b936f9584f06e80b1232a716a074377abd5c2b3f0")!
        XCTAssertEqual(CryptoX11.skein512(from: data), hash)
    }
    
    func testKessak512Empty() {
        let data = Data(hex: "")!
        let hash = Data(hex: "0eab42de4c3ceb9235fc91acffe746b29c29a8c366b7c60e4e67c466f36a4304c00fa9caf9d87976ba469bcbe06713b435f091ef2769fb160cdab33d3670680e")!
        XCTAssertEqual(CryptoX11.keccak512(from: data), hash)
    }
    
    func testGroestl512Empty() {
        let data = Data(hex: "")!
        let hash = Data(hex: "6d3ad29d279110eef3adbd66de2a0345a77baede1557f5d099fce0c03d6dc2ba8e6d4a6633dfbd66053c20faa87d1a11f39a7fbe4a6c2f009801370308fc4ad8")!
        XCTAssertEqual(CryptoX11.groestl512(from: data), hash)
    }
    
    func testGroestl512Value() {
        let data = "Groestl is an Austrian dish, usually made of leftover potatoes and pork, cut into slice.".data(using: .utf8)!
        let hash = Data(hex: "eefdf4c9d6b6fd53390049388de8974525b406206114a8885016aa36619652535835a22ab0be05a81ea15f47ebaed9c236a79f354f699e45b6a7aebc9648695d")!
        XCTAssertEqual(CryptoX11.groestl512(from: data), hash)
    }
    
    func testShavite512Value() {
        let data = "DASH".data(using: .utf8)!
        let hash = Data(hex: "45f24351ef4f5b7477214efe97f8cef4d69007e94e1e5f397011c4fecd4517fe69c509ea6aa758a9055dd6d0864b885498f4fdab5cc0458dbf98e7069b2c52dd")!
        XCTAssertEqual(CryptoX11.shavite512(from: data), hash)
    }
    
    func testCubeHash512Value() {
        let data = "Hello".data(using: .utf8)!
        let hash = Data(hex: "dcc0503aae279a3c8c95fa1181d37c418783204e2e3048a081392fd61bace883a1f7c4c96b16b4060c42104f1ce45a622f1a9abaeb994beb107fed53a78f588c")!
        XCTAssertEqual(CryptoX11.cubehash512(from: data), hash)
    }
    
    func testX11() {
        let data = Data(hex: "020000002cc0081be5039a54b686d24d5d8747ee9770d9973ec1ace02e5c0500000000008d7139724b11c52995db4370284c998b9114154b120ad3486f1a360a1d4253d310d40e55b8f70a1be8e32300")!
        let hash = Data(hex: "f29c0f286fd8071669286c6987eb941181134ff5f3978bf89f34070000000000")!
        XCTAssertEqual(CryptoX11.x11(from: data), hash)
    }
    
}

extension Data {
    
    init?(hex: String) {
        let len = hex.count / 2
        var data = Data(capacity: len)
        for i in 0..<len {
            let j = hex.index(hex.startIndex, offsetBy: i * 2)
            let k = hex.index(j, offsetBy: 2)
            let bytes = hex[j..<k]
            if var num = UInt8(bytes, radix: 16) {
                data.append(&num, count: 1)
            } else {
                return nil
            }
        }
        self = data
    }
    
}
