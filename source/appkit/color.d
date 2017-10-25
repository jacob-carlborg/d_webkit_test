module appkit.color;

import core_graphics.color;

extern (Objective-C):

interface NSColor
{
    private alias This = typeof(this);

    interface Class
    {
        extern (C) pragma(mangle, "objc_lookUpClass") static typeof(this) objc_lookUpClass(const(char)* name);

        private static Class classof()
        {
            return objc_lookUpClass(This.stringof);
        }

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
