#line 1 "Tweak.xm"









@class AVFlashlightInternal;

@interface AVFlashlight : NSObject {

	AVFlashlightInternal* _internal;

}

@property (getter=isAvailable,nonatomic,readonly) BOOL available; 
@property (getter=isOverheated,nonatomic,readonly) BOOL overheated; 
@property (nonatomic,readonly) float flashlightLevel; 
+(BOOL)hasFlashlight;
+(void)initialize;
-(void)_handleNotification:(id)arg1 payload:(id)arg2 ;
-(float)flashlightLevel;
-(void)_setupFlashlight;
-(void)_teardownFlashlight;
-(BOOL)isOverheated;
-(void)_reconnectToServer;
-(BOOL)turnPowerOnWithError:(id*)arg1 ;
-(void)turnPowerOff;
-(BOOL)setFlashlightLevel:(float)arg1 withError:(id*)arg2 ;
-(BOOL)isAvailable;
-(id)init;
-(void)dealloc;
@end

static AVFlashlight *fleshilght;
static BOOL flashlightEnabled = NO;

void toggleFlashlight() 
{
    if (flashlightEnabled) 
    {
        [fleshilght setFlashlightLevel:0 withError:nil];
        flashlightEnabled = NO;
    }
    else 
    {
        [fleshilght setFlashlightLevel:1 withError:nil];
        flashlightEnabled = YES;
    }

}


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UIWindow; 
static void (*_logos_orig$_ungrouped$UIWindow$motionEnded$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL, UIEventSubtype, UIEvent *); static void _logos_method$_ungrouped$UIWindow$motionEnded$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL, UIEventSubtype, UIEvent *); 

#line 55 "Tweak.xm"



static void _logos_method$_ungrouped$UIWindow$motionEnded$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIEventSubtype motion, UIEvent * event) {
    _logos_orig$_ungrouped$UIWindow$motionEnded$withEvent$(self, _cmd, motion, event);
    if(event.type == UIEventSubtypeMotionShake && self == [[UIApplication sharedApplication] keyWindow])
    {
        toggleFlashlight();
    }
}



static __attribute__((constructor)) void _logosLocalCtor_b68da157(int __unused argc, char __unused **argv, char __unused **envp) 
{
	fleshilght = [[AVFlashlight alloc] init];
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIWindow = objc_getClass("UIWindow"); MSHookMessageEx(_logos_class$_ungrouped$UIWindow, @selector(motionEnded:withEvent:), (IMP)&_logos_method$_ungrouped$UIWindow$motionEnded$withEvent$, (IMP*)&_logos_orig$_ungrouped$UIWindow$motionEnded$withEvent$);} }
#line 72 "Tweak.xm"
