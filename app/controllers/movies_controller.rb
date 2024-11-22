class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movies = Movie.find(params[:id])
  end

  def new
    @movies = Movie.new
  end

  def create
    @movies = Movie.new(movie_params)
    @movies.save
    redirect_to movie_path(@movie)
  end

  def edit
    @movies = Movie.find(params[:id])
  end

  def update
    @movies = Movie.find(params[:id])
    @movies.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    @movies = movies.find(params[:id])
    @movies.destroy
    redirect_to movie_path, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
