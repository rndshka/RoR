class ArticlesController < ApplicationController
  def create
    @article = Article.new(params[:article].permit!)
    @article.save
  end
end
