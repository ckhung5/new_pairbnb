class Reservation < ActiveRecord::Base

  # validates :start_date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/,message: "Invalid start date"}
  # validates :end_date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/,message: "Invalid end date"}
  belongs_to :listing
  belongs_to :user
end
