class Record < ActiveRecord::Base
  belongs_to :user

  # def self.return_begin_cash
  # 	Record.select("begin_cash").where(round: record_params[:round], user_id: record_params[:user_id])
  # end
end
