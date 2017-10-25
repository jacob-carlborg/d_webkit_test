module util;

import objc.objc : object_getInstanceVariable, object_setInstanceVariable, id;

struct Ivar(const char* name, T)
{
    id self;

    alias value this;

    T value()
    {
        T value;
        object_getInstanceVariable(self, name, cast(void**) &value);
        return value;
    }

    void opAssign(T value)
    {
        object_setInstanceVariable(self, name, cast(void*) value);
    }
}

auto ivar(const char* name, T, Self)(Self self)
{
    return Ivar!(name, T)(cast(id) self);
}
