//
//  NIKKARSA.m
//  Bugatti
//
//  Created by toby on 21/02/2017.
//  Copyright © 2017 toby. All rights reserved.
//

#import "NIKKARSA.h"
#import "RSAEncryptor.h"
@interface NIKKARSA()

@property (nonatomic,copy) NSString *publickKey;
@property (nonatomic,copy) NSString *privateKey;

@end
@implementation NIKKARSA

+ (NIKKARSA *)share{
    return [[NIKKARSA alloc] init];
}

- (NSString *)privateKey{
    if(!_privateKey){
        _privateKey = @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAMX6h/1onU622q1xNt5B80h6uJlGiJaaHuTrSK7T/7CSql5CowfSCmdwQ5wUZuUWBkb7FWH0IaFly+aZ8Hw8Ue2bKCLrhTHmnz2sIw6RLdrxk5KzAqCNlJoYqvgtTWK+iCWv10mEQFRQyvrJJ/zK12eZC3+sagfNGKbu+Dqd0/WfAgMBAAECgYAUWse0hBb4StB82JD9lOZAY22rRJcydLIMcyxL3TwCmXGus0czvKKZM++fknFpyDPpBFOUeJckkuS91sHk5AbAKsAN8sRrJCKSFIWjQ5QnSoeVCsN1ZYSsuGUwGA4S6tzfTI5Umft3QUHVQi99/hkJ2QDd7i+8hiZ45YgWaxUU8QJBAO4hM5W1ve9Z/1iNxhK2awWPaDcQMvjfkaz+Os4LzVcQzS9eJ9qrB96YaAn7FctsYmTsR1Bwc9QFbvs3xe/FvZsCQQDU1fkHwgG8iyStaREhGcnJ3W3Lo2VC3dQtSwB/UPjV4hnpC5cgWSVcf/v87JxRcdx5F0gzVaWupWCuVpud46pNAkBXmqNNmlTLr0I/I7kQvUdV/lIKn80Avc7r44NitfjO5QF3QZ5L1cvJWiw8L8Du22q/UiVSNGyIPY98oCITeZ2tAkAdQQvptRDoCXgRHc/s7M5/oJ/mzZ6tgjAXyadX2JlbTKijD6TGHXq1LCJGsX8K8suLGVgjNjJ/vtt7Gwxot1JBAkB9S0QqmhO5WWRbxTMJfhDlLD2O3/rw/ej2S/xMtB0Vdnq9ido9ftLOJWGWYtAgbeBgDSCYoB7R/yQq28GFQ4Fd";
    }
    return _privateKey;
}
- (NSString *)publickKey{
    if(!_publickKey){
        _publickKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDYyGP6Uu2i0hs2XZsBK1eqeemK1nBm5n3wiJaOb5z74G2Z2VoPf+Coq4TvEdXyj5S0UuBZdFautPjcVYvfLhHV/vfyO2XoUaBL1O1ZSZMlwvglVteTbxAC1a6dfog6LOuZf4nfM3lkLS7V7Gf86iVCp9wgLdA6Xcx6cOFO9s992wIDAQAB";
    }
    return _publickKey;
}

- (NSString *)encryptString:(NSString *)str{
    return [RSAEncryptor encryptString:str publicKey:self.publickKey];
}

- (NSString *)decryptString:(NSString *)str{
    return [RSAEncryptor decryptString:str privateKey:self.privateKey];
}
@end
