Class extends DataStoreImplementation



Function setPrivilege($priv : Text) : Text
	
	Session:C1714.clearPrivileges()
	Session:C1714.setPrivileges($priv)
	
	Use (Session:C1714.storage)
		Session:C1714.storage.info:=New shared object:C1526("who"; Current user:C182; "whatTime"; String:C10(Current time:C178(); HH MM:K7:2))
	End use 
	
	return Session:C1714.getPrivileges().join(" ")
	
	
Function getPrivileges() : Text
	return Session:C1714.getPrivileges().join(" ")
	
	
Function getOTP() : Text
	return Session:C1714.createOTP(60)
	
	
exposed Function getUserInfo() : Text
	return "Session id: "+String:C10(Session:C1714.id)+"\n \n"+"Welcome "+Session:C1714.storage.info.who+"! \n \n"+"You put the "+Session:C1714.getPrivileges().join(" ")+" privilege in the session at "+Session:C1714.storage.info.whatTime
	
	
Function getSessionId() : Text
	return Session:C1714.id
	
	
Function getLicenseUsage() : Collection
	return License usage:C1782
	
	
exposed Function authentify($priv : Text)
	Session:C1714.clearPrivileges()
	Session:C1714.setPrivileges($priv)
	
	Use (Session:C1714.storage)
		Session:C1714.storage.info:=New shared object:C1526("who"; Current user:C182; "whatTime"; String:C10(Current time:C178(); HH MM:K7:2))
	End use 
	
	return Session:C1714.getPrivileges().join(" ")