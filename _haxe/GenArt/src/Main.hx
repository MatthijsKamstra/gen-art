package;

import js.html.HtmlElement;
import js.html.DOMWindow;
import js.html.*;
// import js.JQuery;
import jQuery.*;
import mconsole.*;

class Main
{
	
	static public var _window:DOMWindow;
	static public var _document:Dynamic;

	function new()
	{
		_window   = js.Browser.window;
		_document = js.Browser.document;
		
		new JQuery( function():Void 
		{
			if(new JQuery('body').hasClass('post')) 
			{
				trace ('post');
				return;
			}

			// when document is ready
			var count = new JQuery('section');

			var array:Array<HtmlElement> = [];
			for (i in 0...count.length)
			{
				var htmlEl:HtmlElement = cast (count[i]);
				array.push (htmlEl);
				// new js.JQuery(_document.body).prepend ('<a href="#'+htmlEl.id+'">'+htmlEl.id+'</a>');
			}
			new JQuery("section img" ).wrap( "<div class='preview'></div>" );
			new JQuery(".preview" ).prepend( "<span class='cutline'/>" );

			var w = new JQuery('.preview').width();
			if(w != 0) new JQuery('.preview').height(w*.66);

			trace('document ready: section: ' + count);
			trace (array.length , array[3]);
		
		});
	}

    static public function main()
    {
       var main = new Main();
	}
}