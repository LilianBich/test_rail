class ArticlesController < ApplicationController
  # to create all this instance method I used
  # $ rails generate controller articles index show new edit update create delete

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    renderer = Redcarpet::Render::HTML.new
    @markdown = Redcarpet::Markdown.new(renderer, extensions = {})
  end

  def new
    @article = Article.new
  end

  def create
    article.create(article_params)
    redirect_to articles_path
  end

  def edit
  end

  def update
    article.update(params[:id],article_params)
    redirect_to articles_path
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:content, :title)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
