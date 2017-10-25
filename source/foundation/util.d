module foundation.util;

alias NSUInteger = size_t;
alias NSInteger = ptrdiff_t;

mixin template MetaclassTrait()
{
    import std.meta : Alias;

    alias Parent = Alias!(__traits(parent, typeof(this)));

    extern (C) pragma(mangle, "objc_lookUpClass")
        static typeof(this) objc_lookUpClass(const(char)* name);

    extern (D) private static Class classof()
    {
        import std.exception : enforce;
        enum name = __traits(identifier, Parent);

        return objc_lookUpClass(name)
            .enforce("Failed to lookup class: " ~ name);
    }
}

mixin template ClassTrait()
{
    extern(Objective-C) interface Class
    {
        mixin MetaclassTrait;

        Parent alloc() @selector("alloc");
    }

    extern (D) private static Class classof()
    {
        return Class.classof;
    }

    extern (D) static typeof(this) alloc()
    {
        return classof.alloc();
    }
}
