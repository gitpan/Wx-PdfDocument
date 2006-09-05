use strict;
use Wx::build::MakeMaker 0.28;

##
## at present we simply force the link to the wxpdfdoc source
our $WX_PDF_PATH = "$ENV{WXDIR}/contrib/wxpdfdoc";

wxWriteMakefile(
	NAME			=> 'Wx::PdfDocument',
	VERSION_FROM	=> 'lib/Wx/PdfDocument.pm',
	WX_CORE_LIB		=> 'core base adv xml',
	LIBS			=> "-L$WX_PDF_PATH/lib wxpdfdoc",
	INC				=> "-I$WX_PDF_PATH/include",
);
