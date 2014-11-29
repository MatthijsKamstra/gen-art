(function () { "use strict";
var Main = function() {
	this.counter = 0;
	this.array = [];
	Main.window = window;
	Main.document = window.document;
	new js.JQuery(Main.document.body).ready($bind(this,this.onDocumentReadyHandler));
};
Main.main = function() {
	var main = new Main();
};
Main.prototype = {
	onDocumentReadyHandler: function(e) {
		if(Main.document.body.classList.length != 0 && Main.document.body.classList.contains("post")) {
			console.log("DONT DO ANYTHING :: post page");
			return;
		}
		var list = Main.document.getElementsByTagName("section");
		var _g1 = 0;
		var _g = list.length;
		while(_g1 < _g) {
			var i = _g1++;
			this.array.push(list[i]);
		}
		new js.JQuery("section img").wrap("<div class='preview'></div>");
		new js.JQuery(".preview").prepend("<span class='cutline' />");
		var w = new js.JQuery(".preview").width();
		if(w != 0) new js.JQuery(".preview").height(w * .66 | 0);
		var str = "<div class=\"mc-col-0 mx2 fixed quickmenu z2\">\n\t\t\t\t\t<a id=\"up\"   href=\"#!\" class=\"button-gray block center\"><img src=\"img/icons/up.svg\" class=\"icon p1\"></a>\n\t\t\t\t\t<a id=\"down\" href=\"#!\" class=\"button-gray block center\"><img src=\"img/icons/down.svg\" class=\"icon p1\"></a>\n\t\t\t\t\t</div>";
		new js.JQuery("body").prepend(str);
		new js.JQuery("a#up").click($bind(this,this.onClickHandler));
		new js.JQuery("a#down").click($bind(this,this.onClickHandler));
		new js.JQuery(Main.document.body).keydown($bind(this,this.onKeyHandler));
	}
	,onKeyHandler: function(event) {
		var _g = event.keyCode;
		switch(_g) {
		case 38:
			this.scrollToPost("up");
			event.preventDefault();
			break;
		case 40:
			this.scrollToPost("down");
			event.preventDefault();
			break;
		}
	}
	,scrollToPost: function(dir) {
		new js.JQuery(Main.document.body).stop();
		var scroll = new js.JQuery(Main.document.body).scrollTop();
		var offset = new js.JQuery(this.array[this.counter]).context.offsetTop;
		if(offset == scroll) {
			if(dir == "up") this.counter--; else this.counter++;
		} else {
			var _g1 = 0;
			var _g = this.array.length;
			while(_g1 < _g) {
				var i = _g1++;
				var offset1 = new js.JQuery(this.array[i]).context.offsetTop;
				if(scroll >= offset1) this.counter = i;
			}
		}
		if(this.counter < 0) {
			this.counter = 0;
			offset = 0;
		} else if(this.counter > this.array.length - 1) {
			this.counter = this.array.length - 1;
			offset = new js.JQuery(Main.document.body).height();
		} else offset = new js.JQuery(this.array[this.counter]).context.offsetTop;
		new js.JQuery(Main.document.body).animate({ scrollTop : offset},1000);
	}
	,onClickHandler: function(event) {
		if(event.currentTarget.id == "up") this.scrollToPost("up"); else this.scrollToPost("down");
	}
};
var js = {};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
var q = window.jQuery;
js.JQuery = q;
Main.main();
})();

//# sourceMappingURL=GenArt.js.map