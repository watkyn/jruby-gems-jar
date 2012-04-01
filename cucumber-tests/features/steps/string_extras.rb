class String

  def node
    "badstuff"
  end

end


Given /^and xml fragment '(.*)'$/ do |xml|
  @xml = xml
end

When /^(.*) is called on an instance of String$/ do |method|
  @result = "".send method
end

Then /^the value should be '(.*)'$/ do |expected_value|
  @result.should eql(expected_value)
end
