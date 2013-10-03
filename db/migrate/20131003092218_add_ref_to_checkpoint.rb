class AddRefToCheckpoint < ActiveRecord::Migration
  def change
    add_reference :checkpoints, :city, index: true
  end
end
