module appkit.view;

import foundation.geometry;
import foundation.ns_object;
import foundation.util;

import quartz_core.layer;

extern (Objective-C):

interface NSView
{
    mixin ClassTrait;

    NSView init() @selector("init");
    NSView initWithFrame(NSRect frameRect) @selector("initWithFrame:");

    void addSubview(NSView view) @selector("addSubview:");

    bool wantsLayer() @selector("wantsLayer");
    // use `int` as workaround for https://github.com/ldc-developers/ldc/issues/2387
    void wantsLayer(int value) @selector("setWantsLayer:");

    CALayer layer() @selector("layer");
    void uiDelegate(NSObject) @selector("setUIDelegate:");
}
