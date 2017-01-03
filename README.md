# AceTM-iOS-Demo
AceTM SDK를 적용하기 위한 데모 어플리케이션입니다.

## Project에 SDK 추가하는 방법  
* Framework 추가하기 (Xcode>프로젝트파일> AceTM-x.y.z.framework Drag&Drop)
![Screenshot](https://github.com/nhndnt/AceTM-iOS-Demo/blob/master/images/README1.png)
* Framwoke 설정하기 (프로젝트>Embedded Binaries> AceTM-x.y.z.framework 추가)
![Screenshot](https://github.com/nhndnt/AceTM-iOS-Demo/blob/master/images/README2.png)
* 중복 Framwork 링크 제거(경우에 따라 Linked Frameworks and Libraries가 두개 추가 될 수 있음)
* 프로젝트> 프로젝트>Embedded Binaries> AceTM-x.y.z.framework 추가 > AceTM-x.y.z.framework 2개중 하나 삭제
![Screenshot](https://github.com/nhndnt/AceTM-iOS-Demo/blob/master/images/README3.png)
## SDK 기본 설정 
* 인터넷 퍼미션 추가 (info.plist)
![Screenshot](https://github.com/nhndnt/AceTM-iOS-Demo/blob/master/images/README5.png)
* AceCounter SID 설정 (info.plist)
![Screenshot](https://github.com/nhndnt/AceTM-iOS-Demo/blob/master/images/README6.png)
* AppDelegate Class 설정
``` swift
//in swift
import AceTM
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AceTM.appDidFinishLaunching(responder: self)
        return true
}
```
``` objective-c
//in objective-c
#import <AceTM/AceTM-Swift.h>
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AceTM appDidFinishLaunchingWithResponder:self];
    return YES;
}
```
* CPA 측정용 Deep-link 설정
![Screenshot](https://github.com/nhndnt/AceTM-iOS-Demo/blob/master/images/README7.png)
- URL Schemes는 “ACE” + SID  구성 입력. (중요: 반드시 대문자로 입력할것)
- identifier는 자신의 페키지 고유 id 입력
