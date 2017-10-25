module foundation.url;

import foundation.string;
import foundation.util;

extern (Objective-C):

interface NSURL
{
    interface Class
    {
        mixin MetaclassTrait;

        Parent alloc() @selector("alloc");
        NSURL urlWithString(NSString urlString) @selector("URLWithString:");
    }

    extern (D) static
    {
        private Class classof()
        {
            return Class.classof;
        }

        NSURL alloc()
        {
            return classof.alloc();
        }

        NSURL urlWithString(string str)
        {
            return classof.urlWithString(str.toNSString);
        }
    }
}
