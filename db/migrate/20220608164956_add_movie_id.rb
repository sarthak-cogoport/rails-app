class AddMovieId < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :imdbID, :string
  end
end
