LIB_DIR = File.expand_path File.dirname(__FILE__)
require 'mechanize'
require 'selenium-webdriver'

# PHANTOMJS_PATH = File.expand_path("#{LIB_DIR}/phantomjs.exe")

class Mechanize
	def parse_html(data, uri="http://www.example.com")
		uri = URI.parse(uri) unless uri.is_a?(URI)
		page = Mechanize::Page.new( uri, {'content-type' => 'text/html'}, data, "200", self)
		self.history.push(page)
		page
	end

	def set
		self.max_history = 1
		self.read_timeout = 5
		self.open_timeout = 5
		self.follow_meta_refresh = true
		self.redirection_limit=5
		self.user_agent_alias = 'Windows Mozilla'
		self.request_headers = {'accept-language' => 'en'}
		self
	end

end
$wait = Selenium::WebDriver::Wait.new(:timeout => 8)

class Selenium::WebDriver::Driver

	def set(param = {:wait => 5})
		self.manage.timeouts.implicit_wait = param[:wait]
		self
	end
	def search_wait
		$wait
	end
	def search_wait=(t)
		$wait = Selenium::WebDriver::Wait.new(:timeout => t)
	end
	def get_param(param)
		match = param =~ /(^#|^\/\/)/ ? $1 : nil
		return :tag_name => param unless match
		return :id => param[1..param.length] if match == "#"
		return :xpath => param if match == "//"
	end
	def search(param)
		$wait.until { self.find_elements(get_param(param)) }
	end
	def at(param)
		$wait.until { self.find_element(get_param(param)) }
	end
end

class Selenium::WebDriver::Element
	def select(id, obj)
		Selenium::WebDriver::Support::Select.new(self).select_by(id, obj)
	end
end


