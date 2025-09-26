Class extends DataStoreImplementation



exposed Function authentify($credentials : Object) : Text
	
	var $result : Text
	
	TRACE:C157
	
	If ($credentials.identifier="info")
		
		If (Session:C1714.storage.info#Null:C1517)
			return "Products"
		Else 
			return "Main"
		End if 
		
	Else 
		
		Session:C1714.clearPrivileges()
		
		//Try
		$user:=ds:C1482.User.query("identifier = :1"; $credentials.identifier).first()
		
		If ($user#Null:C1517)
			If ($user.password=$credentials.password)
				
				Use (Session:C1714.storage)
					Session:C1714.storage.info:=New shared object:C1526("who"; $user.identifier; "whatTime"; String:C10(Time:C179(Current time:C178())))
				End use 
				
				Session:C1714.setPrivileges({roles: $user.role})
				
				$result:="OK"
			Else 
				$result:="KO"
			End if 
		Else 
			$result:="KO"
		End if 
		
		//Catch
		//$result:="Main"
		//End try
	End if 
	
	return $result
	
	
exposed Function getOTP() : Text
	return Session:C1714.createOTP()