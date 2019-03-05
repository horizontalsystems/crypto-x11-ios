import Foundation
import HSCryptoX11.Private

public struct CryptoX11 {

    static public func x11(from data: Data) -> Data {
        return _Hash.x11(data)
    }

    static public func blake512(from data: Data) -> Data {
        return _Hash.blake512(data)
    }

    static public func bmw512(from data: Data) -> Data {
        return _Hash.bmw512(data)
    }

    static public func groestl512(from data: Data) -> Data {
        return _Hash.groestl512(data)
    }

    static public func skein512(from data: Data) -> Data {
        return _Hash.skein512(data)
    }

    static public func jh512(from data: Data) -> Data {
        return _Hash.jh512(data)
    }

    static public func keccak512(from data: Data) -> Data {
        return _Hash.keccak512(data)
    }

    static public func luffa512(from data: Data) -> Data {
        return _Hash.luffa512(data)
    }

    static public func cubehash512(from data: Data) -> Data {
        return _Hash.cubehash512(data)
    }

    static public func shavite512(from data: Data) -> Data {
        return _Hash.shavite512(data)
    }

    static public func simd512(from data: Data) -> Data {
        return _Hash.simd512(data)
    }

    static public func echo512(from data: Data) -> Data {
        return _Hash.echo512(data)
    }

}
