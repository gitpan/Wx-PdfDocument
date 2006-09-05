#use strict;
##
## main
##
my $doc = MyPdfDoc->new;

my $header = [
  [ "Country",			40 ],
  [ "Capital",			35 ],
  [ "Area (sq km)",		40 ],
  [ "Pop. (thousands)",	45 ]
];

my $data = $doc->LoadData('countries.txt');
$doc->SetFont( 'Arial', '', 14 );
$doc->AddPage();
$doc->BasicTable( $header, $data );
$doc->AddPage();
$doc->FancyTable( $header, $data );
$doc->SaveAsFile( 'sample4.pdf' );

package MyPdfDoc;

use strict;
use base qw( Wx::PdfDocument );

#use Wx::PdfDocument qw( wxPDF_BORDER_LEFT wxPDF_BORDER_FRAME );
#use Wx qw( wxPDF_BORDER_LEFT wxPDF_BORDER_RIGHT wxPDF_BORDER_TOP wxPDF_BORDER_FRAME );
use Wx qw( :pdf );

sub new {
	bless shift->SUPER::new( @_ );
}

sub BasicTable {
	my ( $doc, $header, $data ) = @_;

	# first the table header
    foreach my $col (@$header) {
		$doc->Cell( 40, 7, $col->[0], wxPDF_BORDER_FRAME );
    }

	# Line break
    $doc->Ln();

	foreach my $line (@$data) {
		my @cols = split( /;/, $line );
		$doc->Cell( 40, 6, $cols[0], wxPDF_BORDER_FRAME );
		$doc->Cell( 40, 6, $cols[1], wxPDF_BORDER_FRAME );
		$doc->Cell( 40, 6, $cols[2], wxPDF_BORDER_FRAME );
		$doc->Cell( 40, 6, $cols[3], wxPDF_BORDER_FRAME );
		$doc->Ln();
    }
}

sub FancyTable {
	my ( $doc, $header, $data ) = @_;

    # Header -- colors, line width and bold font
    $doc->SetFillColor( Wx::Colour->new( 255, 0, 0 ));			# red
    $doc->SetTextColor( Wx::Colour->new( 255, 255, 255 ) );		# white
	#$doc->SetTextColor( 255 );									# white
    $doc->SetDrawColor( Wx::Colour->new( 128, 0, 0 ));
    $doc->SetLineWidth( .3 );
    $doc->SetFont( '', 'B' );

	# first the table header
	my $w = 0;
    foreach my $col (@$header) {
      $doc->Cell( $col->[1], 7, $col->[0], wxPDF_BORDER_FRAME, 0, wxPDF_ALIGN_CENTER, 1 );
	  $w += $col->[1];
    }

	# Line break
    $doc->Ln();

    # Color and font restoration
    $doc->SetFillColor( Wx::Colour->new( 224, 235, 255 ));
    #$doc->SetTextColor( 0 );
    $doc->SetTextColor( Wx::Colour->new( 0, 0, 0 ) );		# black
	$doc->SetFont( '' );

	my $fill = 0;
	foreach my $line (@$data) {
		my @cols = split( /;/, $line );
		next unless $cols[0];
		$doc->Cell( $header->[0][1], 6, $cols[0], wxPDF_BORDER_LEFT | wxPDF_BORDER_RIGHT, 0,wxPDF_ALIGN_LEFT, $fill );
		$doc->Cell( $header->[1][1], 6, $cols[1], wxPDF_BORDER_LEFT | wxPDF_BORDER_RIGHT, 0,wxPDF_ALIGN_LEFT, $fill );
		$doc->Cell( $header->[2][1], 6, $cols[2], wxPDF_BORDER_LEFT | wxPDF_BORDER_RIGHT, 0,wxPDF_ALIGN_RIGHT, $fill );
		$doc->Cell( $header->[3][1], 6, $cols[3], wxPDF_BORDER_LEFT | wxPDF_BORDER_RIGHT, 0,wxPDF_ALIGN_RIGHT, $fill );
		$doc->Ln();
		$fill = 1 - $fill;
    }
    $doc->Cell( $w, 0, '', wxPDF_BORDER_TOP );
}

sub LoadData {
	my ( $self, $filename ) = @_;

	# get text from the file
	open FH, $filename or die $!;
	my @data = <FH>;
	close FH;
	[ @data ];
}
