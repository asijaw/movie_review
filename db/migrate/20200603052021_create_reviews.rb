class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :user_id
      t.integer :movie_id
      t.string :rating

      t.timestamps
    end
  end
end
