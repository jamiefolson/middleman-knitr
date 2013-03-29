require File.expand_path('../helper', __FILE__)

describe Middleman::Renderers::KnitrTemplate do
	it "registered for '.Rmd' files" do
		assert_equal Middleman::Renderers::KnitrTemplate, Tilt["test.Rmd"]
	end
	
	it "loading and evaluating templates on #render" do
    template = Middleman::Renderers::KnitrTemplate.new { |t| "Hello World!" }
    assert_equal "Hello World!", template.render
  end
	
	it "basics" do
		template = Middleman::Renderers::KnitrTemplate.new { "```{r echo=FALSE, results='asis'}\ncat(6 * 6)\n```" }
		assert_equal "36", template.render
  end
	
end
