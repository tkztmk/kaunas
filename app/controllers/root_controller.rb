class RootController < ApplicationController
  before_filter :authenticate, except: [:index]
  def index
    @article = Article.find_by_identifier('root')
  end
end
