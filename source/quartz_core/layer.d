module quartz_core.layer;

import core_graphics.color;
import foundation.geometry;

extern (Objective-C):

interface CALayer
{
    CGFloat borderWidth() @selector("borderWidth");
    void borderWidth(CGFloat value) @selector("setBorderWidth:");

    CGColorRef borderColor() @selector("borderColor");
    void borderColor(CGColorRef) @selector("setBorderColor:");
}
