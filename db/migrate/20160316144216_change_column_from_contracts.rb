class ChangeColumnFromContracts < ActiveRecord::Migration
  def change
    rename_column :contracts, :type, :contract_type
  end
end
