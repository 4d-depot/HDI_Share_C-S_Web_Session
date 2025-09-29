

Form:C1466.otp:=ds:C1482.getOTP()

Form:C1466.url:="http://localhost/$lib/renderer/?w=Start&$4DSID="+Form:C1466.otp

WA OPEN URL:C1020(*; "WebPage"; Form:C1466.url)