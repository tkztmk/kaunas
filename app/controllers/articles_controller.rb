class ArticlesController < ApplicationController

  before_filter :authenticate, except: [:index, :show]

  def index
    @articles = Article.all
    @title = 'Article List'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end


  def show
    @article = Article.find_by_identifier(params[:id])
    @title = @article.identifier
    if @article.nil? then
      render file: "#{Rails.root}/public/404.html", status: '404 Not Found'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @article }
      end
    end
  end


end

