import Foundation

public struct CryptoX11 {

    static public func x11(from data: Data) -> Data {
        return CryptoX11Hash.x11(data)
    }

    static public func blake512(from data: Data) -> Data {
        return CryptoX11Hash.blake512(data)
    }

    static public func bmw512(from data: Data) -> Data {
        return CryptoX11Hash.bmw512(data)
    }

    static public func groestl512(from data: Data) -> Data {
        return CryptoX11Hash.groestl512(data)
    }

    static public func skein512(from data: Data) -> Data {
        return CryptoX11Hash.skein512(data)
    }

    static public func jh512(from data: Data) -> Data {
        return CryptoX11Hash.jh512(data)
    }

    static public func keccak512(from data: Data) -> Data {
        return CryptoX11Hash.keccak512(data)
    }

    static public func luffa512(from data: Data) -> Data {
        return CryptoX11Hash.luffa512(data)
    }

    static public func cubehash512(from data: Data) -> Data {
        return CryptoX11Hash.cubehash512(data)
    }

    static public func shavite512(from data: Data) -> Data {
        return CryptoX11Hash.shavite512(data)
    }

    static public func simd512(from data: Data) -> Data {
        return CryptoX11Hash.simd512(data)
    }

    static public func echo512(from data: Data) -> Data {
        return CryptoX11Hash.echo512(data)
    }

}
