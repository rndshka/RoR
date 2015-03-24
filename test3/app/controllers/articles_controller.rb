class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page]).per(10).order('created_at DESC')
  end

  def show
    @article = Article.find(params[:id])
  end
end
