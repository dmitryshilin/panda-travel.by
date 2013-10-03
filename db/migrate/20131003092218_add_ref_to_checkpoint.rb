class AddRefToCheckpoint < ActiveRecord::Migration
  def change
    add_reference :checkpoints, :country, index: true
  end
end
