use Wx::PdfDocument;

my $file = "sample1.pdf";
my $doc = Wx::PdfDocument->new;
$doc->AddPage();
$doc->SetFont( "Arial", "B", 16 );
$doc->Cell( 40, 10, "Hello World!" );
$doc->SaveAsFile( $file );
print "The PDF file $file was successfully created.\n";

