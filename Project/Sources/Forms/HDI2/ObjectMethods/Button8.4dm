

If (btnTrace)
	TRACE:C157
End if 


Form:C1466.otp:=ds:C1482.getOTP()

Form:C1466.url:="http://localhost/$lib/renderer/?w=Products&$4DSID="+Form:C1466.otp

WA OPEN URL:C1020(*; "QodlyPage"; Form:C1466.url)