class ArticlesController < ApplicationController
	
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def new
		@article = Article.new
	end

	def index
		@articles = Article.all
	end

	def create
			@article = Article.new(article_params)
			if @article.save
				flash[:notice] = "Article was succesfully created."
				redirect_to @article
			else
				render :new
			end
	end

	def show
	end

	def edit
	end

	def update
		if @article.update(article_params)
			flash[:notice] = "Article was successfully updated."
			redirect_to @article
		else
			render :edit
		end
	end

	def destroy
		@article.destroy
		flash[:notice] = "Article was successfully deleted."
		redirect_to @article
	end


	private
	def article_params
		params.require(:article).permit(:title, :description)
	end

	def set_article
		@article = Article.find(params[:id])
	end
end