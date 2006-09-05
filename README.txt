Wx-PdfDocument version 0.05
===========================

INSTALLATION

Ensure the following tasks are complete before you begin to attempt 
to install this module.

- wxPdfDocument is compiled and a DLL is created.
- wxpdfdoc.dll is copied to the /perl/site/lib/auto/wx folder.
- the build process assumes that wxpdfdoc is located at WXDIR/contrib/wxpdfdoc
  if this is not true then change Makefile.PL before beginning

Once these have been completed you can continue to build
wxPdfDocument using the following arguments:

Makefile.PL
nmake
nmake test
nmake install

TODO

- many more classes & methods need wrapping
- create a DemoModules plugin
- remove files included from the wxPerl source (typemap.xsp & wx_xspp.pl)
- remove hardcoded link to wxPdfDocument source in Makefile.PL

DEPENDENCIES

This module requires these other modules and libraries:

  wxWidgets    Open source cross platform GUI framework
  wxPerl       Perl wrapper to the wxWidgets toolkit
  wxpdfdoc     Native PDF library from wxCode

COPYRIGHT AND LICENCE

Copyright (C) 2006 by Mark Wardell

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


