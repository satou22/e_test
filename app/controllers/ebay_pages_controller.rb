require 'lib.rb'

class EbayPagesController < ApplicationController

	@@agent ||= Mechanize.new.set
	@@render_agent ||= Mechanize.new.set
	def initilize
		super
	end
  def get
  end

  def home
#     @page = @@agent.get("http://www.ebay.com/sch/ebayadvsearch/?rt=nc")
		@@agent.get("http://re.pdata.jp/")
		@page = @@render_agent.get(@@agent.page.uri)
#     head = @@agent.page.at("head").add_child(_head)
#     body = @@agent.page.at("body").add_child(_script)
		render text: @page.body.to_s
  end

	private
		def _head
			<<-JS
				<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
				<script type="text/javascript" src="http://localhost:3000/app/assets/javascripts/test.js"></script>
			JS
		end
		def _script()
			<<-JS 
			<script type="text/javascript">
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
			</script>
			JS
		end
end
