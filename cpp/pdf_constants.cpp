/////////////////////////////////////////////////////////////////////////////
// Name:        cpp/pdf_constants.cpp
// Purpose:     constants for Wx::PdfDocument
// Author:      Mark Wardell
// Created:     31/01/2006
// RCS-ID:      $Id: pdf_constants.cpp,v 1.0 2005/05/03 20:44:37 netcon Exp $
// Copyright:   (c) 2006 Mark Wardell
// Licence:     This program is free software; you can redistribute it and/or
//              modify it under the same terms as Perl itself
/////////////////////////////////////////////////////////////////////////////

#include "cpp/constants.h"

double pdf_constant( const char* name, int arg )
{
    // !package: Wx
    // !parser: sub { $_[0] =~ m<^\s*r\w*\(\s*(\w+)\s*\);\s*(?://(.*))?$> }
    // !tag: pdf

#define r( n ) if( strEQ( name, #n ) ) return n;

    WX_PL_CONSTANT_INIT();
    if( strlen( name ) >= 7 )
        fl = name[6];		// skip the wxPDF_
    else
        fl = 0;

    switch( fl )
    {
      case 'A':
         r( wxPDF_ALIGN_LEFT );
         r( wxPDF_ALIGN_CENTER );
         r( wxPDF_ALIGN_RIGHT );
         r( wxPDF_ALIGN_JUSTIFY );
         break;
      case 'B':
         r( wxPDF_BORDER_NONE );
         r( wxPDF_BORDER_LEFT );
         r( wxPDF_BORDER_RIGHT );
         r( wxPDF_BORDER_TOP );
         r( wxPDF_BORDER_BOTTOM );
         r( wxPDF_BORDER_FRAME );
         break;
      case 'C':
         r( wxPDF_CORNER_NONE );
         r( wxPDF_CORNER_TOP_LEFT );
         r( wxPDF_CORNER_TOP_RIGHT );
         r( wxPDF_CORNER_BOTTOM_LEFT );
         r( wxPDF_CORNER_BOTTOM_RIGHT );
         r( wxPDF_CORNER_ALL );
         break;
      case 'P':
         r( wxPDF_PERMISSION_PRINT );
         r( wxPDF_PERMISSION_MODIFY );
         r( wxPDF_PERMISSION_COPY );
         r( wxPDF_PERMISSION_ANNOT );
         break;
      case 'S':
         r( wxPDF_STYLE_DRAW );
         r( wxPDF_STYLE_FILL );
         r( wxPDF_STYLE_FILLDRAW );
         r( wxPDF_STYLE_DRAWCLOSE );
         r( wxPDF_STYLE_MASK );
         break;
    }
#undef r

    WX_PL_CONSTANT_CLEANUP();
}

wxPlConstants pdf_module( &pdf_constant );
