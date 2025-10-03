

If (btnTrace)
	TRACE:C157
End if 


//Generate an OTP on the server
Form:C1466.otp:=ds:C1482.getOTP()

//Add to OTP value as the $4DSID parameter in the URL of the Qodly page
Form:C1466.url:="http://localhost/$lib/renderer/?w=Start&$4DSID="+Form:C1466.otp

