//
//  export.h
//  libtess
//
//  Created by renan jegouzo on 31/03/2016.
//  Copyright © 2016 aestesis. All rights reserved.
//

#ifndef export_h
#define export_h

#include <stdio.h>


typedef void (TessBegin)(unsigned int);
typedef void (TessDraw)(void*);
typedef void (TessEnd)(void);

typedef struct  {
    double x; // SIMD3 aligned/packed as SIMD4
    double y;
    double z;
    double w;
    double u; // SIMD2 aligned/packed as SIMD2
    double v;
} TessVertex;

void *tessInit(TessBegin *begin, TessDraw *draw, TessEnd *end);
void tessDelete(void *tess);

void tessBeginPolygon(void *tess);
void tessEndPolygon(void *tess);
void tessBeginContour(void *tess);
void tessEndContour(void *tess);
void tessSendVertex(void *tess, TessVertex* vertex, int count);


#endif /* export_h */
