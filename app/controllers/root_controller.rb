class RootController < ApplicationController
  def index
    @document = Article.find_by_identifier('root')
  end
end
