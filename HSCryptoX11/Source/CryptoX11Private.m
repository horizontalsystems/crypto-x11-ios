//
//  Methods from NSData+Dash.m
//  DashSync
//
//  Created by Quantum Explorer on 01/31/17.
//  Copyright (c) 2018 Quantum Explorer <quantum@dash.org>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "CryptoX11Private.h"

#import <Blake.h>
#import <Bmw.h>
#import <CubeHash.h>
#import <Groestl.h>
#import <Echo.h>
#import <Jh.h>
#import <Keccak.h>
#import <Luffa.h>
#import <Shavite.h>
#import <Simd.h>
#import <Skein.h>

@implementation CryptoX11Hash

typedef union _UInt512 {
    uint8_t u8[512/8];
    uint16_t u16[512/16];
    uint32_t u32[512/32];
    uint64_t u64[512/64];
} UInt512;

typedef union _UInt256 {
    uint8_t u8[256/8];
    uint16_t u16[256/16];
    uint32_t u32[256/32];
    uint64_t u64[256/64];
} UInt256;


#define UINT512_ZERO ((UInt512) { .u64 = { 0, 0, 0, 0, 0, 0, 0, 0 } })

+ (UInt256)_x11:(NSData *)data {
    NSData *copy = [data copy];
    UInt512 x11Data = UINT512_ZERO;

    sph_blake_big_context ctx_blake;
    sph_blake512_init(&ctx_blake);
    sph_blake512(&ctx_blake, copy.bytes, copy.length);
    sph_blake512_close(&ctx_blake, &x11Data);

    sph_bmw_big_context ctx_bmw;
    sph_bmw512_init(&ctx_bmw);
    sph_bmw512(&ctx_bmw, &x11Data, 64);
    sph_bmw512_close(&ctx_bmw, &x11Data);

    sph_groestl_big_context ctx_groestl;
    sph_groestl512_init(&ctx_groestl);
    sph_groestl512(&ctx_groestl, &x11Data, 64);
    sph_groestl512_close(&ctx_groestl, &x11Data);

    sph_skein_big_context ctx_skein;
    sph_skein512_init(&ctx_skein);
    sph_skein512(&ctx_skein, &x11Data, 64);
    sph_skein512_close(&ctx_skein, &x11Data);

    sph_jh_context ctx_jh;
    sph_jh512_init(&ctx_jh);
    sph_jh512(&ctx_jh, &x11Data, 64);
    sph_jh512_close(&ctx_jh, &x11Data);

    sph_keccak_context ctx_keccak;
    sph_keccak512_init(&ctx_keccak);
    sph_keccak512(&ctx_keccak, &x11Data, 64);
    sph_keccak512_close(&ctx_keccak, &x11Data);

    sph_luffa512_context ctx_luffa;
    sph_luffa512_init(&ctx_luffa);
    sph_luffa512(&ctx_luffa, &x11Data, 64);
    sph_luffa512_close(&ctx_luffa, &x11Data);

    sph_cubehash_context ctx_cubehash;
    sph_cubehash512_init(&ctx_cubehash);
    sph_cubehash512(&ctx_cubehash, &x11Data, 64);
    sph_cubehash512_close(&ctx_cubehash, &x11Data);

    sph_shavite_big_context ctx_shavite;
    sph_shavite512_init(&ctx_shavite);
    sph_shavite512(&ctx_shavite, &x11Data, 64);
    sph_shavite512_close(&ctx_shavite, &x11Data);

    sph_simd_big_context ctx_simd;
    sph_simd512_init(&ctx_simd);
    sph_simd512(&ctx_simd, &x11Data, 64);
    sph_simd512_close(&ctx_simd, &x11Data);

    sph_echo_big_context ctx_echo;
    sph_echo512_init(&ctx_echo);
    sph_echo512(&ctx_echo, &x11Data, 64);
    sph_echo512_close(&ctx_echo, &x11Data);

    return *(UInt256 *) (uint8_t *) x11Data.u8;
}

+ (NSData *)x11:(NSData *)data {
    return [CryptoX11Hash dataWithUInt256: [CryptoX11Hash _x11: data]];
}


+ (NSData *)blake512: (NSData *)data {
    UInt512 blakeData;

    sph_blake_big_context ctx_blake;
    sph_blake512_init(&ctx_blake);
    sph_blake512(&ctx_blake, data.bytes, data.length);
    sph_blake512_close(&ctx_blake, &blakeData);

    return [CryptoX11Hash dataWithUInt512:blakeData];
}

+ (NSData *)bmw512: (NSData *)data {
    UInt512 bmwData;

    sph_bmw_big_context ctx_bmw;
    sph_bmw512_init(&ctx_bmw);
    sph_bmw512(&ctx_bmw, data.bytes, data.length);
    sph_bmw512_close(&ctx_bmw, &bmwData);

    return [CryptoX11Hash dataWithUInt512:bmwData];
}

+ (NSData *)groestl512: (NSData *)data {
    UInt512 groestlData;

    sph_groestl_big_context ctx_groestl;
    sph_groestl512_init(&ctx_groestl);
    sph_groestl512(&ctx_groestl, data.bytes, data.length);
    sph_groestl512_close(&ctx_groestl, &groestlData);

    return [CryptoX11Hash dataWithUInt512:groestlData];
}

+ (NSData *)skein512: (NSData *)data {
    UInt512 skeinData;

    sph_skein_big_context ctx_skein;
    sph_skein512_init(&ctx_skein);
    sph_skein512(&ctx_skein, data.bytes, data.length);
    sph_skein512_close(&ctx_skein, &skeinData);

    return [CryptoX11Hash dataWithUInt512:skeinData];
}

+ (NSData *)jh512: (NSData *)data {
    UInt512 jhData;
    sph_jh_context ctx_jh;
    sph_jh512_init(&ctx_jh);
    sph_jh512(&ctx_jh, data.bytes, data.length);
    sph_jh512_close(&ctx_jh, &jhData);

    return [CryptoX11Hash dataWithUInt512:jhData];
}

+ (NSData *)keccak512: (NSData *)data {
    UInt512 keccakData;

    sph_keccak_context ctx_keccak;
    sph_keccak512_init(&ctx_keccak);
    sph_keccak512(&ctx_keccak, data.bytes, data.length);
    sph_keccak512_close(&ctx_keccak, &keccakData);

    return [CryptoX11Hash dataWithUInt512:keccakData];
}

+ (NSData *)luffa512: (NSData *)data {
    UInt512 luffaData;

    sph_luffa512_context ctx_luffa;
    sph_luffa512_init(&ctx_luffa);
    sph_luffa512(&ctx_luffa, data.bytes, data.length);
    sph_luffa512_close(&ctx_luffa, &luffaData);

    return [CryptoX11Hash dataWithUInt512:luffaData];
}

+ (NSData *)cubehash512: (NSData *)data {
    UInt512 cubehashData;

    sph_cubehash_context ctx_cubehash;
    sph_cubehash512_init(&ctx_cubehash);
    sph_cubehash512(&ctx_cubehash, data.bytes, data.length);
    sph_cubehash512_close(&ctx_cubehash, &cubehashData);

    return [CryptoX11Hash dataWithUInt512:cubehashData];
}

+ (NSData *)shavite512: (NSData *)data {
    UInt512 shaviteData;

    sph_shavite_big_context ctx_shavite;
    sph_shavite512_init(&ctx_shavite);
    sph_shavite512(&ctx_shavite, data.bytes, data.length);
    sph_shavite512_close(&ctx_shavite, &shaviteData);

    return [CryptoX11Hash dataWithUInt512:shaviteData];
}

+ (NSData *)simd512: (NSData *)data {
    UInt512 simdData;

    sph_simd_big_context ctx_simd;
    sph_simd512_init(&ctx_simd);
    sph_simd512(&ctx_simd, data.bytes, data.length);
    sph_simd512_close(&ctx_simd, &simdData);

    return [CryptoX11Hash dataWithUInt512:simdData];
}

+ (NSData *)echo512: (NSData *)data {
    UInt512 echoData;

    sph_echo_big_context ctx_echo;
    sph_echo512_init(&ctx_echo);
    sph_echo512(&ctx_echo, data.bytes, data.length);
    sph_echo512_close(&ctx_echo, &echoData);

    return [CryptoX11Hash dataWithUInt512:echoData];
}

+ (NSData *)dataWithUInt512:(UInt512)n {
    return [NSData dataWithBytes:&n length:sizeof(n)];
}

+ (NSData *)dataWithUInt256:(UInt256)n {
    return [NSData dataWithBytes:&n length:sizeof(n)];
    
}

@end
