module foundation.url_request;

import foundation.url;
import foundation.util;

extern (Objective-C):

interface NSURLRequest
{
    mixin ClassTrait;

    NSURLRequest init() @selector("init");
    NSURLRequest url(NSURL url) @selector("initWithURL:");
}
