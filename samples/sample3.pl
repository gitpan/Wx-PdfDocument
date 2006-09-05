use Wx::PdfDocument;

use strict;

##
## main
##
my $doc = MyPdfDoc->new;

#$doc->SetMyTitle( "20000 Leagues Under the Seas" );
$doc->SetAuthor( 'Jules Verne' );
$doc->PrintChapter( 1, 'A RUNAWAY REEF', '20k_c1.txt' );
$doc->PrintChapter( 2, 'THE PROS AND CONS', '20k_c2.txt' );
$doc->SaveAsFile( 'sample3.pdf' );

package MyPdfDoc;

use strict;
use base qw( Wx::PdfDocument );

sub new {
	bless shift->SUPER::new( @_ );
}

sub ChapterTitle {
	my ( $doc, $num, $title ) = @_;

    $doc->SetFont( 'Arial', '', 12 );
    $doc->SetFillColor( Wx::Colour->new( 200,220,255 ));		# Background color

	# Title
    $doc->CellFull( 0, 6, "Chapter $num : $title", 0, 1, 0, 1 );

	#Line break
    $doc->Ln( 4 );
}

sub ChapterBody {
	my ( $doc, $filename ) = @_;

	# get text from the file
	open FH, $filename;
	my @txt = <FH>;
	close FH;

    # Times 12
    $doc->SetFont( 'Times', '', 12);

	# Output justified text
    $doc->MultiCell( 0, 5, join( '', @txt ));

	# Line break
    $doc->Ln();

	# Mention in italics
    $doc->SetFont( '', 'I' );
    $doc->Cell( 0, 5, '(end of excerpt)' );
}

sub PrintChapter {
	my ( $doc, $num, $title, $filename ) = @_;
    $doc->AddPage();
    $doc->ChapterTitle( $num, $title );
    $doc->ChapterBody( $filename );
}
