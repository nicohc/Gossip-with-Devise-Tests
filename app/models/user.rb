class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :anonymous_username, presence: true,
                        format: { with: /\A[a-zA-Z0-9_]*\z/ }
                        #RegExp du format anonymous_username


  #Pour voir la solution trouvée pour créer une restriction à l'entrée
  #https://stackoverflow.com/questions/28787615/add-invite-code-to-devise
  attr_accessor :secret_code
  validates :secret_code, presence: true,
                          on: :create,
                          inclusion: { in: ["THP"] }

  has_many :gossips

end
