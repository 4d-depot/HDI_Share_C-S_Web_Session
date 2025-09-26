

$otp:=ds:C1482.getOTP()

WA OPEN URL:C1020(*; "WebPage"; "http://localhost/$lib/renderer/?w=Start&$4DSID="+$otp)