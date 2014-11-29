package;

import js.html.HtmlElement;
import js.html.DOMWindow;
import js.html.*;
import js.JQuery;
import mconsole.*;

class Main
{
	
	static public var window:DOMWindow;
	static public var document:js.html.Document;

	var array:Array<Dynamic> = [];
	// var array:Array<HtmlElement> = [];
	var counter:Int = 0;
	


	function new()
	{
		window   = js.Browser.window;
		document = js.Browser.document;
		
		// http://youmightnotneedjquery.com/#ready
		// document.addEventListener('DOMContentLoaded', onDocumentReadyHandler);

		new js.JQuery(document.body).ready(onDocumentReadyHandler);
	}

	function onDocumentReadyHandler(e:Dynamic):Void
	{
		// trace (document.body.classList.length);
		// http://youmightnotneedjquery.com/#has_class
		if(document.body.classList.length != 0 && document.body.classList.contains('post'))
		{
			trace('DONT DO ANYTHING :: post page');
			return;
		}

		// js.Lib.alert('should be index/archeif');

		// get sections :: new JQuery('section');
		var list = document.getElementsByTagName('section');
		// trace (list);
		for (i in 0...list.length) {
			array.push(list[i]);
			// trace(list[i]);
		}

		// var list2 = document.querySelector('section img')
		// for (i in 0...list2.length) {
		// 	utils.JQ.wrapElem( innerId : String , wrapType : String , wrapperId : String , className : String )
		// }

		// wrap is difficult in javascript
		new js.JQuery('section img').wrap("<div class='preview'></div>");
		new js.JQuery('.preview').prepend("<span class='cutline' />");

		var w:Int = 	new js.JQuery('.preview').width();
		if(w != 0) 		new js.JQuery('.preview').height(Std.int(w*.66));

		var str = '<div class="mc-col-0 mx2 fixed quickmenu z2">
					<a id="up"   href="#!" class="button-gray block center"><img src="img/icons/up.svg" class="icon p1"></a>
					<a id="down" href="#!" class="button-gray block center"><img src="img/icons/down.svg" class="icon p1"></a>
					</div>';

		// var node:js.html.Node = new js.html.Node();
		// node.nodeValue = str;			
		// document.body.insertBefore( newChild : js.html.Node , refChild : js.html.Node )
		new js.JQuery('body').prepend( str );	
		// document.body.insertBefore(node, document.body.firstChild);	

		new js.JQuery('a#up').click( onClickHandler );
		new js.JQuery('a#down').click( onClickHandler );

		new js.JQuery(document.body).keydown(onKeyHandler);

		// document.getElementById('down').click();
	}
	
	function onKeyHandler(event:js.JqEvent):Void
	{
		// trace (event);
		

		switch (event.keyCode) {
			case 38 : /* trace('cursor button up'); */   scrollToPost('up');   event.preventDefault();
			case 40 : /* trace('cursor button down'); */ scrollToPost('down'); event.preventDefault();
		}
	}


	private function scrollToPost(dir:String):Void
	{
		// kill previous animation
		new js.JQuery(document.body).stop();
		
		// get current position scroll
		var scroll = new js.JQuery(document.body).scrollTop();
		var offset = new js.JQuery(array[counter]).context.offsetTop;
		if( offset == scroll){
			if(dir == 'up'){
				counter--;
			} else {
				counter++;
			}
		} else {		
			for (i in 0...array.length) {
				var offset = new js.JQuery(array[i]).context.offsetTop;
				if(scroll >= offset){
					counter = i;
				}
			}
		}

		if(counter < 0) {
			counter = 0; 
			offset = 0; // mck move to the top of the page
		} else if(counter > array.length-1) {
			counter = array.length-1; // move to the bottom of the page
			offset = new js.JQuery(document.body).height();
		} else {
			offset = new js.JQuery(array[counter]).context.offsetTop;
		}

		new js.JQuery(document.body).animate({scrollTop:offset},1000);	
	}


	private function onClickHandler(event:js.JqEvent):Void
	{
		if(event.currentTarget.id == 'up'){
			scrollToPost('up');
		} else {
			scrollToPost('down');
		}
	}


    static public function main()
    {
       var main = new Main();
	}
}