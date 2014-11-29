
package utils;

class JQ 
{

	function new(el:Dynamic):Void
	{
		return this;		
	}	

	// wrapElem( 'myImage', "span", "mySpan", "mySpanStyle" );
	static public function wrapElem( innerId:String, wrapType:String, wrapperId:String, className:String )
	{
		var innerElem = document.getElementById( innerId ),
		wrapper = document.createElement( wrapType );  

		wrapper.appendChild( innerElem.parentNode.replaceChild( wrapper, innerElem ) );

		wrapper.id = wrapperId; 

		wrapper.className = className;

		return wrapper;
	}


}