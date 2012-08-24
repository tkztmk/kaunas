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


  def new
    @article = Article.new
    @title = 'Create New Article'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end


  def edit
    @article = Article.find_by_identifier(params[:id])
    @title = "Edit Article #{@article.identifier}"
    if @article.nil? then 
      render file: "#{Rails.root}/public/404.html", status: '404 Not Found'
    end
  end


  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @article = Article.find_by_identifier(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @article = Article.find_by_identifier(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
