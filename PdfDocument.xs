/////////////////////////////////////////////////////////////////////////////
// Name:        PdfDocument.xs
// Purpose:     XS for Wx::PdfDocument Module
// Author:      Mark Wardell
// Modified by:
// Created:     24/07/2006
// RCS-ID:      $Id: PdfDocument.xs,v 1.0 2006/07/24 00:00:00 netcon Exp $
// Copyright:   (c) 2006 Mark Wardell
// Licence:     This program is free software; you can redistribute it and/or
//              modify it under the same terms as Perl itself
/////////////////////////////////////////////////////////////////////////////

#include <wx/pdfdoc.h>
#include <wx/cmndata.h>
#include <wx/print.h>

#define PERL_NO_GET_CONTEXT
#include "cpp/wxapi.h"
#undef THIS
#undef IsSet
#pragma warning ( disable: 4702) // unreachable code

MODULE=Wx__PdfDocument

BOOT:
  INIT_PLI_HELPERS( wx_pli_helpers );

INCLUDE: perl script/wx_xspp.pl -t typemap.xsp XS/PdfDocument.xsp |

#include "cpp/pdf_constants.cpp"

#  //FIXME//tricky
#if defined(__WXMSW__)
#undef XS
#define XS( name ) WXXS( name )
#endif

MODULE=Wx__PdfDocument
