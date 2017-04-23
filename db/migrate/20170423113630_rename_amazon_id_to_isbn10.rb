class RenameAmazonIdToIsbn10 < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :amazon_id, :isbn10
  end
end
