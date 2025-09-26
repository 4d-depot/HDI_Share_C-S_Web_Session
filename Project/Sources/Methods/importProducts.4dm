//%attributes = {}


var $productsFile : 4D:C1709.File
var $productsCol : Collection

$productsFile:=File:C1566("/PACKAGE/Project/Sources/Shared/products.json")
$productsCol:=JSON Parse:C1218($productsFile.getText())

$notDroppped:=ds:C1482.Products.all().drop()


var $pict : Picture

var $folder : 4D:C1709.Folder
var $path; $picturePath : Text
var $item : Object

$folder:=Folder:C1567(fk database folder:K87:14)
$path:=Convert path system to POSIX:C1106($folder.platformPath)
//$path+="Project/Sources/"  //Goliath:Users:JPR2:Desktop:Training-2022:Studio:DwnldShopping:ShoppingCart.4DBase:"Macintosh HD:Users:marie-sophie:Documents:GitHub:HDI_Share_C-S_Web_Sesson:Project:HDI_Share_C-S_Web_Sesson.4DProject

For each ($item; $productsCol)
	//$picturePath:=$path+Replace string($item.picture; "/$s"; "S")  //     /$shared/visuals/pict1.jpg
	$picturePath:=Convert path POSIX to system:C1107($path+"Project/Sources/"+$item.picture)
	READ PICTURE FILE:C678($picturePath; $pict)
	$item.picture:=$pict
End for each 

ds:C1482.Products.fromCollection($productsCol)

