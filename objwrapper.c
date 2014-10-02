#include <stdlib.h>
#include "objwrapper.h"

objwrapper_t *objwrapper_create(
    void *a_data,
    objwrapper_destructor_t a_destructor
){
    objwrapper_t * objwrapper = malloc(sizeof(objwrapper_t));
    objwrapper->data = a_data;
    objwrapper->destructor = a_destructor;
    objwrapper->reference_count = 1;

    return objwrapper;

}
void * objwrapper_get_object(objwrapper_t *a_objwrapper){
    return a_objwrapper->data;
}

void objwrapper_retain(objwrapper_t *a_objwrapper){
    a_objwrapper->reference_count += 1;
}

void objwrapper_release(objwrapper_t *a_objwrapper){
    a_objwrapper->reference_count -= 1;

    if(a_objwrapper->reference_count == 0){
        a_objwrapper->destructor(a_objwrapper->data);
    }

    free(a_objwrapper);
}

void main(){
    
}
