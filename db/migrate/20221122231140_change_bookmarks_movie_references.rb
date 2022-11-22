class ChangeBookmarksMovieReferences < ActiveRecord::Migration[7.0]
  def change
    change_column_null :bookmarks, :movie_id, true
  end
end
