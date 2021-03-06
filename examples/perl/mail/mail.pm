use Mail::Sendmail;

sub send {
  my ($event) = @_;
  my $url = $ENV{'MAIL_SMTP_URL'};
  my $from = $ENV{'MAIL_FROM'};

  %mail = (
    Smtp  => $url,
    To      => $event->{'data'}{'to'},
    From    => $from,
    Subject => $event->{'data'}{'subject'},
    Message => $event->{'data'}{'text'}
  );

  sendmail(%mail) or die $Mail::Sendmail::error;
  return $Mail::Sendmail::log."\n";
}
1;