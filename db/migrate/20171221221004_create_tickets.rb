class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :ticket_type
      t.text :description
      t.time :accomplish_time
      t.string :author
      t.string :executor
      t.string :status

      t.timestamps
    end
  end
end
