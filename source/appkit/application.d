module appkit.application;

import appkit.responder;

import foundation.notification;
import foundation.util;

extern (Objective-C):

int NSApplicationMain(int argc = 0, const char*[] argv = null);

enum NSApplicationActivationPolicy : ptrdiff_t {
    /* The application is an ordinary app that appears in the Dock and may have a user interface.  This is the default for bundled apps, unless overridden in the Info.plist. */
    regular,

    /* The application does not appear in the Dock and does not have a menu bar, but it may be activated programmatically or by clicking on one of its windows.  This corresponds to LSUIElement=1 in the Info.plist. */
    accessory,

    /* The application does not appear in the Dock and may not create windows or be activated.  This corresponds to LSBackgroundOnly=1 in the Info.plist.  This is also the default for unbundled executables that do not have Info.plists. */
    prohibited
};

interface NSApplication : NSResponder
{
    interface Class
    {
        mixin MetaclassTrait;
        NSApplication shared_() @selector("sharedApplication");
    }

    extern (D) static NSApplication shared_()
    {
        return Class.classof.shared_();
    }

    NSApplicationDelegate delegate_() @selector("delegate");
    void delegate_(NSApplicationDelegate) @selector("setDelegate:");

    bool setActivationPolicy(NSApplicationActivationPolicy activationPolicy) @selector("setActivationPolicy:");

    // use `int` as workaround for https://github.com/ldc-developers/ldc/issues/2387
    void activateIgnoringOtherApps(int flag) @selector("activateIgnoringOtherApps:");

    void run() @selector("run");
}

__gshared NSApplication NSApp;

// shared static this()
// {
//     NSApp = NSApplication.shared_;
// }

interface NSApplicationDelegate
{
    void applicationDidFinishLaunching(NSNotification notification) @selector("applicationDidFinishLaunching:");
}
