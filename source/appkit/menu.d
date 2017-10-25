module appkit.menu;

import appkit.menu_item;

import foundation.util;
import foundation.ns_object;
import foundation.string;

import objc.objc : SEL;

extern (Objective-C):

interface NSMenu : NSObject
{
    mixin ClassTrait;

    NSMenu init() @selector("init");
    NSMenu init(NSString title) @selector("initWithTitle:");

    void setSubmenu(NSMenu menu, NSMenuItem item) @selector("setSubmenu:forItem:");
    void addItem(NSMenuItem newItem) @selector("addItem:");

    NSMenuItem addItem(
        NSString title,
        SEL selector,
        NSString charCode
    ) @selector("addItemWithTitle:action:keyEquivalent:");
}
