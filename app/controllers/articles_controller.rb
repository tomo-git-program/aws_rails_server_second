class ArticlesController < ApplicationController
  def create
    @article = Article.new(article_params)
    if(@article.save)
      render json: {"article": @article}
    else
      render json: { errors: @article.errors }, status: :unprocessable_entity
    end  
  end

  def get
    @article = Article.find_by(slug: params[:id])
    render json: {"article": @article}
  end
  
  def get_all
    @articles = Article.all
    render json: {"articles": @articles}
  end

  def update
    @article = Article.find_by(slug: params[:slug])
    if @article.update(article_params)
      render json: {"article": @article}
    end
  end

  def delete
    @article = Article.find_by(slug: params[:slug])
    @article.destroy
    if(@article.destroy)
      render json: {"article": @article}, status: :no_content
    end
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end


end
