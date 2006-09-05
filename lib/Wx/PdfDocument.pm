package Wx::PdfDocument;

use warnings;
use strict;
use vars qw( $VERSION @constants );
use Wx;

$VERSION = '0.05';
@constants = qw(
	 wxPDF_ALIGN_LEFT
	 wxPDF_ALIGN_CENTER
	 wxPDF_ALIGN_RIGHT
	 wxPDF_ALIGN_JUSTIFY
	 wxPDF_BORDER_NONE
	 wxPDF_BORDER_LEFT
	 wxPDF_BORDER_RIGHT
	 wxPDF_BORDER_TOP
	 wxPDF_BORDER_BOTTOM
	 wxPDF_BORDER_FRAME
	 wxPDF_CORNER_NONE
	 wxPDF_CORNER_TOP_LEFT
	 wxPDF_CORNER_TOP_RIGHT
	 wxPDF_CORNER_BOTTOM_LEFT
	 wxPDF_CORNER_BOTTOM_RIGHT
	 wxPDF_CORNER_ALL
	 wxPDF_PERMISSION_PRINT
	 wxPDF_PERMISSION_MODIFY
	 wxPDF_PERMISSION_COPY
	 wxPDF_PERMISSION_ANNOT
	 wxPDF_STYLE_DRAW
	 wxPDF_STYLE_FILL
	 wxPDF_STYLE_FILLDRAW
	 wxPDF_STYLE_DRAWCLOSE
	 wxPDF_STYLE_MASK
);

push @Wx::EXPORT_OK, @constants;
$Wx::EXPORT_TAGS{'pdf'} = [ @constants ];

Wx::wx_boot( 'Wx::PdfDocument', $VERSION );

1;

__END__
=head1 NAME

Wx::PdfDocument - interface to the wxPdfDocument C++ class

=head1 SYNOPSIS

  use Wx::PdfDocument;

=head1 DESCRIPTION

Wx::PdfDocument is a wrapper for the wxPdfDocument wxcode class for the wxWidgets GUI toolkit.

=head2 EXPORT

None by default.

=head2 Exportable constants
  :pdf

=head1 SEE ALSO

L<http://www.wxwidgets.org>
L<http://wxperl.sourceforge.net>, 
L<http://wxcode.sourceforge.net/components/wxpdfdoc>

=head1 AUTHOR

Mark Wardell <mwardell@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2006 by Mark Wardell

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.

The wxPdfDocument C++ class was created by Ulrich Telle <ulrich.telle@gmx.de>

=cut
