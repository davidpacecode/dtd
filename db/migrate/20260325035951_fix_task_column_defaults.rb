class FixTaskColumnDefaults < ActiveRecord::Migration[8.1]
  def change
  change_column_default :tasks, :complete, from: nil, to: false
  change_column_null :tasks, :complete, false, false  # last arg backfills existing nulls with false
  end
end

