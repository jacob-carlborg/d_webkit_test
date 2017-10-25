module appkit.view_controller;

import appkit.view;

import foundation.ns_object;

extern (Objective-C):

interface NSViewController : NSObject
{
    NSView view() @selector("view");
    void view(NSView view) @selector("setView:");
}
