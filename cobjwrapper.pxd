cdef extern from "objwrapper.h":
    void * Alloc(size_t size);
    void Retain( void * ptr);
    void Release( void * ptr);
