#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include "objwrapper.h"

void * Alloc( size_t size )
{
    MemoryObject * o;
    char         * ptr;

    o              = ( MemoryObject * )calloc( sizeof( MemoryObject ) + size, 1 );
    ptr            = ( char * )o;
    ptr           += sizeof( MemoryObject );
    o->retainCount = 1;
    o->data        = ptr;

    return ( void * )ptr;
}

void Retain( void * ptr )
{
    MemoryObject * o;
    char         * cptr;

    cptr  = ( char * )ptr;
    cptr -= sizeof( MemoryObject );
    o     = ( MemoryObject * )cptr;

    o->retainCount++;
}

void Release( void * ptr )
{
    MemoryObject * o;
    char         * cptr;

    cptr  = ( char * )ptr;
    cptr -= sizeof( MemoryObject );
    o     = ( MemoryObject * )cptr;

    o->retainCount--;

    if( o->retainCount == 0 )
    {
        free( o );
    }
}

void * Share( void * ptr){
    Retain(ptr);
    return ptr;
}

void main(){
    int * int1;
    int * int2;

    int1 = (int *)Alloc(sizeof(int));
    int2 = (int *)Share((void *)int1);

    assert(*int1 == *int2);
    assert(int1 == int2);

    Release((void *)int1);
    Release((void *)int2);
}
