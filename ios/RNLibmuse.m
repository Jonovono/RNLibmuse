#import "RNLibmuse.h"
#import <React/RCTLog.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>

@implementation RNLibmuse
@synthesize bridge = _bridge;

static NSString *const MUSES_AVAILABLE = @"LIBMUSE:MusesAvailable";



- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(start)
{
  RCTLogInfo(@"init Libmuse!");

    dispatch_async(dispatch_get_main_queue(), ^{

      if (!self.manager) {
          self.manager = [IXNMuseManagerIos sharedManager];
      }
      
      [self.manager setMuseListener:self];
        
//        [self.muse registerConnectionListener:self];
//
//      [self.muse registerDataListener:self
//                               type:IXNMuseDataPacketTypeArtifacts];
//      [self.muse registerDataListener:self
//                               type:IXNMuseDataPacketTypeAlphaAbsolute];
//
//        [self.muse runAsynchronously];
        [self.manager startListening];
      
       RCTLogInfo(@"I FUCKING DID IT");
    });
}

- (void) museListChanged {
    RCTLogInfo(@"LIBMUSE list changed");
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity: [muses count]];
    
    for (int i = 0; i < [muses count]; i++) {
        IXNMuse * m = [[self.manager getMuses] objectAtIndex:i];
        NSString *name = [m getName];
        NSString *mac = [m getMacAddress];
        
    
        NSDictionary *museDict = @{
           @"name": name,
           @"mac_address": mac,
        };
        
        [array addObject:museDict];
    }
    

    NSLog(@"%@", array);
    
    [self.bridge.eventDispatcher sendAppEventWithName:MUSES_AVAILABLE body:array];
}

RCT_EXPORT_METHOD(connectToMuse) {
    NSArray * muses = [self.manager getMuses];
        
    NSLog(@"CONNECTING TO MUSE");
    IXNMuse *muse = [muses firstObject];
    self.muse = muse;
    
    [self connect];
}

- (void) connect {
    [self.muse registerConnectionListener:self];
    [self.muse registerDataListener:self
                               type:IXNMuseDataPacketTypeArtifacts];
    [self.muse registerDataListener:self
                               type:IXNMuseDataPacketTypeAlphaAbsolute];
    /*
     [self.muse registerDataListener:self
     type:IXNMuseDataPacketTypeEeg];
     */
    [self.muse runAsynchronously];
}

- (void)receiveMuseConnectionPacket:(IXNMuseConnectionPacket *)packet muse:(IXNMuse *)muse {
  RCTLogInfo(@"LIBMUSE connection Packet");
}

-(void)receiveLog:(IXNLogPacket *)log {
//    RCTLogInfo(@"LIBMUSE log packet");
}

-(void)receiveMuseDataPacket:(IXNMuseDataPacket *)packet muse:(IXNMuse *)muse {
//    RCTLogInfo(@"LIBMUSE data packet");
    
    [self.bridge.eventDispatcher sendAppEventWithName:@"DATA" body:[packet values]];
}

-(void)receiveMuseArtifactPacket:(IXNMuseArtifactPacket *)packet muse:(IXNMuse *)muse {
//    RCTLogInfo(@"LIBMUSE artifact packet");
}



- (void) emitMessageToRN: (NSString *)eventName
                        :(NSDictionary *)params{
  // RCTLogInfo(@"EMIT");
  // [self.bridge.eventDispatcher sendAppEventWithName: eventName
  //                                              body: params];
}

@end
