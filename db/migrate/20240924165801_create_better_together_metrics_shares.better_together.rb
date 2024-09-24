# This migration comes from better_together (originally 20240924165142)
class CreateBetterTogetherMetricsShares < ActiveRecord::Migration[7.1]
  def change
    create_bt_table :shares, prefix: :better_together_metrics do |t|
      t.bt_locale
      t.string :platform, null: false
      t.string :url, null: false
      t.datetime :shared_at, null: false
      t.bt_references :shareable, polymorphic: true, index: true

      t.index [:platform, :url]
    end
  end
end