class RootController < ApplicationController
  def index
    @article = Article.find_by_identifier('root')
  end
end
