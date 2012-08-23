require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :document_title => "MyText",
      :document => "MyText",
      :tag => "MyText",
      :document_type => "MyText",
      :document_metadata => "MyText"
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => articles_path, :method => "post" do
      assert_select "textarea#article_document_title", :name => "article[document_title]"
      assert_select "textarea#article_document", :name => "article[document]"
      assert_select "textarea#article_tag", :name => "article[tag]"
      assert_select "textarea#article_document_type", :name => "article[document_type]"
      assert_select "textarea#article_document_metadata", :name => "article[document_metadata]"
    end
  end
end
