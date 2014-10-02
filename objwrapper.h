#ifndef __OBJWRAPPER_H
#define __OBJWRAPPER_H

typedef struct
{
    unsigned int retainCount;
    void       * data;
}
MemoryObject;

void * Alloc( size_t size );

void Retain( void * ptr );

void Release( void * ptr );

void * Share( void * ptr );

#endif
