Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		btnTrace:=False:C215
		
		Form:C1466.identifier:="mary@4d.com"
		Form:C1466.password:="a"
		
		Form:C1466.sessionId:=ds:C1482.authentify({identifier: "info"}).sessionId
		
		Form:C1466.licenseUsage:=ds:C1482.getLicenseUsage()
		
		InitInfo
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			CANCEL:C270
		End if 
		
End case 

