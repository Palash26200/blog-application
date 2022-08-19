class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        # @article = Article.find(params[:id])
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 2)
    end

    def new
        @article = Article.new
    end

    def edit
        # @article = Article.find(params[:id])
    end

    def update
        # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to articles_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def create
        # flash[:notice] = "ok"
        # render plain: params[:article]
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            redirect_to @article
            flash[:notice] = "Article was created successfully."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private 
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description)
    end
end