module foundation.ns_object;

import foundation.util;

extern (Objective-C):

interface NSObject
{
    mixin ClassTrait;

    NSObject init() @selector("init");
}
