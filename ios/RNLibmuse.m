#import "RNLibmuse.h"
#import <React/RCTLog.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>

@implementation RNLibmuse
@synthesize bridge = _bridge;


- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startScan)
{
  RCTLogInfo(@"start scanning chromecast!");

    dispatch_async(dispatch_get_main_queue(), ^{

	   	if (!self.manager) {
	        self.manager = [IXNMuseManagerIos sharedManager];
	    }
	    
	    [self.manager setMuseListener:self];
        
        [self.muse registerConnectionListener:self];
        [self.muse runAsynchronously];
        [self.manager startListening];
	    
//	    [self connect];
       RCTLogInfo(@"I FUCKING DID IT");
    });
  // Initialize device scanner.
    // GCKFilterCriteria *filterCriteria =
    // [GCKFilterCriteria 
    //      criteriaForAvailableApplicationWithID:    kGCKMediaDefaultReceiverApplicationID];
    // self.deviceScanner = 
    //    [[GCKDeviceScanner alloc]     
    //       initWithFilterCriteria:filterCriteria];
    // [self.deviceScanner addListener:self];
    // [self.deviceScanner startScan];
    // [self.deviceScanner setPassiveScan:YES];
}

RCT_EXPORT_METHOD(museListChanged)

{
  RCTLogInfo(@"shit changed");

      [self.bridge.eventDispatcher sendAppEventWithName:@"sexy" body:nil];


  // [self emitMessageToRN: @"sexy": nil];

}


- (void) emitMessageToRN: (NSString *)eventName
                        :(NSDictionary *)params{
  // RCTLogInfo(@"EMIT");
  // [self.bridge.eventDispatcher sendAppEventWithName: eventName
  //                                              body: params];
}

@end
