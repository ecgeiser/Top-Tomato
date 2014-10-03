class MoviesController < ApplicationController

	before_action :authenticate_user!, except: [:show, :index]

	def index
	  @movies = Movie.order(:created_at)
	end

	def new
	  @movie = Movie.new
	end

	def show
	  @movie = Movie.find(params[:id])
	end

	def edit
	  @movie = Movie.find(params[:id])
	end

	def create
	  @movie = Movie.new(movie_params.merge(user_id: current_user.id))
	  if @movie.save
	    redirect_to @movie
	  else
	    render :new
	  end
	end

	def destroy
	  @movie = Movie.find(params[:id])
	  @movie.destroy
	  redirect_to movies_url
	end

	private

	def movie_params
	  params.require(:movie).permit(:title, :critics_score, :release_date, :genre)
	end

end