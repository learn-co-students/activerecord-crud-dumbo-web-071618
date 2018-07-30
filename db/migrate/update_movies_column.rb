class UpdateMoviesColumn < ActiveRecord::Migration

  def change
    change_column(:movies, :release_date, :integer)
  end

end
