Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		btnTrace:=False:C215
		
		Form:C1466.licenseUsage:=ds:C1482.getLicenseUsage()
		
		Form:C1466.sessionId:=ds:C1482.getSessionId()
		
		Form:C1466.privilege:="viewProducts"
		
		Form:C1466.privileges:=ds:C1482.getPrivileges()
		
		
		InitInfo
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			CANCEL:C270
		End if 
		
End case 

