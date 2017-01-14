#import "RCTBridgeModule.h"
#import <Muse/Muse.h>

@interface RNLibmuse : NSObject <RCTBridgeModule, IXNMuseConnectionListener, IXNMuseDataListener, IXNMuseListener, IXNLogListener>

@property IXNMuseManagerIos * manager;
@property (weak, nonatomic) IXNMuse *muse;

@end
  