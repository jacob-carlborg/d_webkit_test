module appkit.responder;

import appkit.menu;

import foundation.util;
import foundation.ns_object;
import foundation.string;

extern (Objective-C):

interface NSResponder : NSObject
{
    mixin ClassTrait;

    NSMenu menu() @selector("menu");
    void menu(NSMenu menu) @selector("setMenu:");
}
