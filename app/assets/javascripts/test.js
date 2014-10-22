//<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
//document.write('<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>');

(function() {
				alert("OK");
	function test() {
		$('a').each(function(i) {
			$(this).bind("click", function() {
				this.href="http://www.yahoo.co.jp";
			});
		});
//    $('#cse-search-box').submit(function(evt) {
//      evt.preventDefault();
//      alert("OK");
//      window.location.href = "http://www.yahoo.co.jp";
//    });
	};
	window.addEventListener("DOMContentLoaded",test, false);
})();
