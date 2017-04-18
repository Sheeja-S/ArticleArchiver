class CreateAllTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:articles) do |t|
      t.column(:title, :string)
      t.column(:link, :string)
      t.column(:shared_by, :string)
      t.column(:like, :integer)

      t.timestamps()
    end

    create_table(:tags) do |t|
      t.column(:name, :string)

      t.timestamps()
    end

    create_table(:users) do |t|
      t.column(:name, :string)
      t.column(:username, :string)
      t.column(:password, :string)

      t.timestamps()
    end

    create_table(:articles_tags) do |t|
      t.column(:article_id, :integer)
      t.column(:tag_id, :integer)

      t.timestamps()
    end

    create_table(:articles_users) do |t|
      t.column(:article_id, :integer)
      t.column(:user_id, :integer)

      t.timestamps()
    end
  end
end
