require 'twitter'

class String

  def send(*args)
    return args[0].reverse
  end

  def watkyn
    Twitter.update("quip")
  end

end

When /^(.*) is called on an instance of String$/ do |method|
  @results = "".send method
end

Then /^the value returned should be '(.*)'$/ do |reversed|
  @results.should eql(reversed)
end

Then /^'quip' is tweeted$/ do
  "".watkyn
end
