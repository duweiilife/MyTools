#Create by Duwei 2017.4.28
#!/bin/perl

if(3!=@ARGV)
{
	die "Usage:$0 sub1 sub2  output!";
}

($key_list, $train_label, $train_txt)=@ARGV;

open(IN,"$train_label") || die "Failed to open file[$train_label]!";


while($line=<IN>)
{
	chomp($line);
	@dat=split(" ",$line);
	$hash{$dat[0]}=$line;
}

close(IN);

open(IN,"$key_list") || die "Failed to open file[$key_list]!";
open (OUT, ">$train_txt") || die "Failed to open file[$train_txt]!";

while($line=<IN>)
{

	chomp($line);
	if(exists $hash{$line})
	{
		print OUT "$hash{$line}\n";
	}
}

close(IN);
close(OUT);
