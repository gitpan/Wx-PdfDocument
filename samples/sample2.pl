use Wx::PdfDocument;

my $doc = MyPdfDoc->new;
$doc->AddPage();
$doc->Image( "smile.jpg", 70, 40, 12);
$doc->Image( "apple.gif", 110, 40, 25);
$doc->SetFont( "Times", "", 12 );

for my $i (0 .. 40) {
	$doc->CellFull( 0, 10, "Printing Line # $i", 0, 1 );
}
$doc->SaveAsFile( "sample2.pdf" );

package MyPdfDoc;

use base qw( Wx::PdfDocument );

sub Header {
	my $doc = shift;

    #$doc->Image( "wxpdfdoc.png" ,10, 8, 28 );

	# Arial bold 15
    $doc->SetFont( "Arial", "B", 15 );
    
	# Move to the right
    $doc->Cell( 80 );

	#Title
    $doc->Cell( 30, 10, "Title", Wx::wxPDF_BORDER_FRAME, 0, Wx::wxPDF_ALIGN_CENTER );

	#Line break
    $doc->Ln( 20 );
}

sub Footer {
	my $doc = shift;
    #Position at 1.5 cm from bottom
    $doc->SetY(-15);
    #Arial italic 8
    $doc->SetFont(_T("Arial"),_T("I"),8);
    #Page number
    $doc->CellFull( 0, 10, sprintf "Page %d/{nb}", $doc->PageNo(), 0, 0, wxPDF_ALIGN_CENTER );
}
