# == Schema Information
#
# Table name: users
#
#  created_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  id                     :bigint(8)        not null, primary key
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  roles                  :string           default([]), is an Array
#  status                 :integer          default("active")
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  ratyrate_rater

  after_create :set_profile
  has_one :profile

  delegate :full_name, to: :profile

  scope :candidates, -> { where("'Candidate' = ANY (roles)") }

  enum status: {
    active: 0,
    inactive: 1
  }

  def candidate?
    roles.include? "Candidate"
  end

  def recruiter?
    roles.include? "Recruiter"
  end

  def admin?
    roles.include? "Admin"
  end

  private

  def set_profile
    address = Address.new
    address.save!
    Profile.create!(user: self, address: address)
  end
end
