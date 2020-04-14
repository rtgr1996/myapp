class ArticlesController < ApplicationController
	before_action:set_article, only:[:show,:edit,:update,:destroy]
	def index
		@article = Article.all
	end
	def show
		
	end
	def new
		@article = Article.new
	end
	def edit
		
	end
	def update
		
		if @article.update(post_params)
			flash[:notice] = "Article was updated successfully."
			redirect_to @article
		else
			render 'edit'
		end
	end
	def destroy
		
		@article.destroy
		redirect_to articles_path
	end
	def create
		#render plain: params[:article].inspect
		@article = Article.new(post_params)
		if @article.save
			flash[:notice] = "Article was created successfully."
			redirect_to @article
		else
			render 'new'
		end
	end
	private 
	def set_article
		@article=Article.find(params[:id])
	end
	def post_params
		params.require(:article).permit(:title,:description)
	end

end
