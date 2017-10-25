module foundation.geometry;

alias CGFloat = double;

struct NSPoint
{
    CGFloat x;
    CGFloat y;
}

struct NSSize
{
    CGFloat width;
    CGFloat height;
}

struct NSRect
{
    NSPoint origin;
    NSSize size;
}

pragma(inline, true) NSPoint NSMakePoint(CGFloat x, CGFloat y) {
    NSPoint p;
    p.x = x;
    p.y = y;
    return p;
}

pragma(inline, true) NSSize NSMakeSize(CGFloat w, CGFloat h) {
    NSSize s;
    s.width = w;
    s.height = h;
    return s;
}

pragma(inline, true) NSRect NSMakeRect(CGFloat x, CGFloat y, CGFloat w, CGFloat h) {
    NSRect r;
    r.origin.x = x;
    r.origin.y = y;
    r.size.width = w;
    r.size.height = h;
    return r;
}
