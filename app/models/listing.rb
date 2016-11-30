class Listing < ActiveRecord::Base
  include PgSearch
  belongs_to :user
  has_many :reservations, :dependent => :destroy
  mount_uploaders :photoes, PhotoesUploader

  pg_search_scope :search ,against: [:address]

  default_scope {where("price >= 0")}
end
