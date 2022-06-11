class MovieController < ApplicationController
    def getMovie
        if params[:id]=="all"
            render json:Movie.all
            return
        end
        render json:Movie.find(params[:id])
    end
    skip_before_action :verify_authenticity_token
    def addMovie
        newMovie = Movie.new(Title:params[:Title], Year:params[:Year],Released:params[:Released],Poster:params[:Poster],Plot:params[:Plot],imdbRating:params[:imdbRating])
        newMovie.save()
        render html:"User added successsfully"
    end
    def updatedMovie
        updateMovie = Movie.find(params[:id])
        Movie.update_all(Title:params[:Title], Year:params[:Year],Released:params[:Released],Poster:params[:Poster],Plot:params[:Plot],imdbRating:params[:imdbRating])
        render html:"Updated successfully"
    end
    def getAll
        for m in params[:data]
            newMovie = Movie.new(Title:m[:Title], Year:m[:Year],Released:m[:Released],Poster:m[:Poster],Plot:m[:Plot],imdbRating:m[:imdbRating],imdbID:m[:imdbID])
            newMovie.save()
        end
        render html:"added all movies"
    end
    def delete
        movie_temp = Movie.find(params[:id])
        movie_temp.destroy()
        render html:"Deleted user"
    end
end
