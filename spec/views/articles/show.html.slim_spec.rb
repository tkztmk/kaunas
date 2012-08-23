require 'spec_helper'

describe "articles/show" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :document_title => "MyText",
      :document => "MyText",
      :tag => "MyText",
      :document_type => "MyText",
      :document_updated_at => "",
      :document_metadata => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
