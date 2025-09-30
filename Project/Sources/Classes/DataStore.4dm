Class extends DataStoreImplementation



exposed Function authentify($credentials : Object) : Object
	
	var $result : Object
	
	$result:={sessionId: Session:C1714.id; page: "NotAuthentified"}
	
	If (Session:C1714.storage.info#Null:C1517)
		$result.authentified:="You are already authentified"
		$result.page:="Products"
	Else 
		
		If ($credentials.identifier#"info")
			
			$result.authentified:=False:C215
			
			Use (Session:C1714.storage)
				Session:C1714.storage.info:=Null:C1517
			End use 
			
			Session:C1714.clearPrivileges()
			
			$user:=ds:C1482.User.query("identifier = :1"; $credentials.identifier).first()
			
			If ($user#Null:C1517)
				If ($user.password=$credentials.password)
					
					Use (Session:C1714.storage)
						Session:C1714.storage.info:=New shared object:C1526("who"; $user.identifier; "whatTime"; String:C10(Current time:C178(); HH MM:K7:2))
					End use 
					
					Session:C1714.setPrivileges({roles: $user.role})
					$result.authentified:="You have been fully authentified"
					$result.page:="Products"
				End if 
			End if 
		End if 
		
	End if 
	
	return $result
	
	
exposed Function getOTP() : Text
	return Session:C1714.createOTP(60)
	
	
exposed Function getUserInfo() : Object
	return Session:C1714.storage.info
	
	
exposed Function getLicenseUsage() : Collection
	return License usage:C1782