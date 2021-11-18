class CreateWupeeNotifications < ActiveRecord::Migration
  def change
    create_table :wupee_notifications do |t|
      t.references :receiver, polymorphic: true
      t.references :attached_object, polymorphic: true
      t.belongs_to :notification_type
      t.integer :notification_type_id
      t.boolean :is_read, default: false
      t.boolean :is_sent, default: false

      t.timestamps null: false
    end

    add_foreign_key :wupee_notifications, :wupee_notification_types, column: :notification_type_id
  end
end
