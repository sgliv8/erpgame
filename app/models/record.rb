class Record < ActiveRecord::Base
  belongs_to :user

  # def self.return_begin_cash
  # 	Record.select("begin_cash").where(round: record_params[:round], user_id: record_params[:user_id])
  # end

  validates_presence_of :round
  validates_presence_of :begin_cash
  validates_presence_of :expenses
  validates_presence_of :revenue 
  validates_presence_of :inventory_penalty
  validates_presence_of :order_penalty
  validates_presence_of :end_cash
end
