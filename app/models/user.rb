#
# Milestone
# Copyright (C) 2012-2013 J. Polgar
# https://github.com/nirix
#
# Milestone is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 only.
#
# Milestone is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Milestone. If not, see <http://www.gnu.org/licenses/>.
#

##
# User model
#
class User < ActiveRecord::Base
  attr_accessible :username, :email, :name, :password, :password_confirmation, :password_digest
  has_secure_password

  belongs_to :group

  validates :username, :password_confirmation, :email, :name, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }, on: :create
  validates :password_digest, confirmation: true
end
