module appkit.menu_item;

import foundation.util;
import foundation.ns_object;
import foundation.string;

import objc.objc : SEL, sel_registerName;

extern (Objective-C):

interface NSMenuItem : NSObject
{
    mixin ClassTrait;

    NSMenuItem init() @selector("init");

    NSMenuItem init(
        NSString title,
        SEL selector,
        NSString charCode
    ) @selector("initWithTitle:action:keyEquivalent:");

    extern (D) final
    {
        NSMenuItem init(string title, const(char)* selector, string charCode)
        {
            return init(title.toNSString, sel_registerName(selector), charCode.toNSString);
        }
    }
}
