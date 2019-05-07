#import "Foundation/Foundation.h"

NS_ASSUME_NONNULL_BEGIN

@interface CryptoX11Hash : NSObject

+ (NSData *)x11:(NSData *)data;
+ (NSData *)blake512:(NSData *)data;
+ (NSData *)bmw512:(NSData *)data;
+ (NSData *)groestl512:(NSData *)data;
+ (NSData *)skein512:(NSData *)data;
+ (NSData *)jh512:(NSData *)data;
+ (NSData *)keccak512:(NSData *)data;
+ (NSData *)luffa512:(NSData *)data;
+ (NSData *)cubehash512:(NSData *)data;
+ (NSData *)shavite512:(NSData *)data;
+ (NSData *)simd512:(NSData *)data;
+ (NSData *)echo512:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
