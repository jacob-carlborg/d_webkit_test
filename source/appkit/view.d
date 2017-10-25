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
    void wantsLayer(bool value) @selector("setWantsLayer:");
    CALayer layer() @selector("layer");
    void uiDelegate(NSObject) @selector("setUIDelegate:");
}
