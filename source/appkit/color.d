module appkit.color;

import core_graphics.color;
import foundation.util;

extern (Objective-C):

interface NSColor
{
    private alias This = typeof(this);

    interface Class
    {
        mixin MetaclassTrait;

        This alloc() @selector("alloc");

        NSColor redColor() @selector("redColor");
    }

    extern (D)
    {
        private static Class classof()
        {
            return Class.classof;
        }

        static This alloc()
        {
            return classof.alloc();
        }

        static NSColor redColor()
        {
            return classof.redColor;
        }
    }

    CGColorRef CGColor() @selector("CGColor");
}
