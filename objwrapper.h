#ifndef __OBJWRAPPER_H
#define __OBJWRAPPER_H

// object wrapper type
typedef struct objwrapper_s objwrapper_t;

// object wrapper destructor type
typedef void (*objwrapper_destructor_t)(void *a_data);

// creates an object wrapper
objwrapper_t *objwrapper_create(
    void *a_data,
    objwrapper_destructor_t a_destructor
);

// returns the object in the object wrapper
void *objwrapper_get_object(objwrapper_t *a_objwrapper);

// retains the object inside a wrapper
void objwrapper_retain(objwrapper_t *a_objwrapper);

// releases the object inside a wrapper
void objwrapper_release(objwrapper_t *a_objwrapper);

struct objwrapper_s {
    void                    *data;
    unsigned                reference_count;
    objwrapper_destructor_t destructor;
};

#endif
