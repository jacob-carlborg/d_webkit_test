module objc.objc;

alias objc_ivar* Ivar;
alias objc_method* Method;
alias objc_object Protocol;

alias char* SEL;
alias objc_class* Class;
alias objc_object* id;

alias extern (C) id function(id, SEL, ...) IMP;

version (X86)
    const int STRUCT_SIZE_LIMIT = 8;

else version (PPC)
    const int STRUCT_SIZE_LIMIT = 4;

else version (X86_64)
    const int STRUCT_SIZE_LIMIT = 16;

else version (PPC64)
    const int STRUCT_SIZE_LIMIT = 16;

struct objc_object
{
    Class isa;
}

struct objc_super
{
    id receiver;
    Class clazz;

    // for dwt compatibility
    alias clazz cls;
    alias clazz super_class;
}

struct objc_class
{
    Class isa;
    Class super_class;
    const char* name;
    int versionn;
    int info;
    int instance_size;
    objc_ivar_list* ivars;
    objc_method_list** methodLists;
    objc_cache* cache;
    objc_protocol_list* protocols;
}

struct objc_ivar
{
    const(char)* ivar_name;
    const(char)* ivar_type;
    int ivar_offset;

    version (X86_64)
        int space;
}

struct objc_ivar_list
{
    int ivar_count;

    version (X86_64)
        int space;

    /* variable length structure */
    objc_ivar[1] ivar_list;
}

struct objc_method
{
    SEL method_name;
    const(char)* method_types;
    IMP method_imp;
}

struct objc_method_list
{
    objc_method_list* obsolete;

    int method_count;

    version (X86_64)
    int space;

    /* variable length structure */
    objc_method[1] method_list;
}

struct objc_cache
{
    uint mask /* total = mask + 1 */;
    uint occupied;
    Method[1] buckets;
}

struct objc_protocol_list
{
    objc_protocol_list* next;
    long count;
    Protocol*[1] list;
}

extern (C):

bool class_addIvar (Class cls, const(char)* name, size_t size, byte alignment, const(char)* types);
bool class_addMethod (Class cls, SEL name, IMP imp, const(char)* types);
bool class_addProtocol(Class cls, Protocol* protocol);
IMP class_getMethodImplementation(Class cls, SEL name);
const(char)* class_getName(Class cls);
Class objc_allocateClassPair (Class superclass, const(char)* name, size_t extraBytes);
Class objc_getClass (const(char)* name);
Protocol* objc_getProtocol(const(char)* name);
Class objc_lookUpClass (const(char)* name);
void objc_registerClassPair (Class cls);
Class object_getClass (id object);
const(char)* object_getClassName (id obj);
Class object_setClass (id object, Class cls);
Ivar object_getInstanceVariable (id obj, const(char)* name, void** outValue);
Ivar object_setInstanceVariable (id obj, const(char)* name, void* value);
SEL sel_registerName (const(char)* str);
id objc_msgSend (id theReceiver, SEL theSelector, ...);
void objc_msgSend_stret(void* stretAddr, id theReceiver, SEL theSelector, ...);
id objc_msgSendSuper (objc_super* superr, SEL op, ...);
Method class_getClassMethod (Class aClass, SEL aSelector);
Method class_getInstanceMethod (Class aClass, SEL aSelector);
Class class_getSuperclass (Class cls);
IMP method_setImplementation (Method method, IMP imp);
id class_createInstance (Class cls, size_t extraBytes);
id objc_getMetaClass (char* name);
void objc_msgSendSuper_stret(void* stretAddr, objc_super* superContext, SEL theSelector, ...);

void instrumentObjcMessageSends(bool val);

version (X86)
    double objc_msgSend_fpret(id self, SEL op, ...);
