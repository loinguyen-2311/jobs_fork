class AddApplyByReferralCodeToCvs < ActiveRecord::Migration[5.0]
  def change
    add_column :cvs, :apply_by_referral_code, :string
  end
end
