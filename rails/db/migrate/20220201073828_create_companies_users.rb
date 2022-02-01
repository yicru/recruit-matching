class CreateCompaniesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :companies_users do |t|
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
