module TestDbHelper
  def establish_coonection
    ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
  end

  def up
    ActiveRecord::Base.connection.create_table :post_table do |t|
      t.integer :name
      t.date :post_date
      t.timestamps
    end
  end

  def down
    ActiveRecord::Base.connection.drop_table :post_table
  end
end
