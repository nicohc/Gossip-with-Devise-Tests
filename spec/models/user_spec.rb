require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
       it 'ensures anonymous_username ou pseudo_de_délateur presence' do
         user = User.new(email:'last@last.fr', password:'bonjour').save
         expect(user).to eq(false)
       end
       #test d'un prénom qui ne contient que des espaces
       it 'ensures anonymous_username not space' do
         user = User.new(email:'last@last.fr', password:'bonjour', anonymous_username:'     ', secret_code:"THP").save
         expect(user).to eq(false)
       end

       it 'ensures email presence' do
         user = User.new(anonymous_username:'jeanmichel', password:'bonjour', secret_code:"THP").save
         expect(user).to eq(false)
       end
       it 'ensures password presence' do
         user = User.new(anonymous_username:'jeanmichel', email:'jm@gossip.fr', secret_code:"THP").save
         expect(user).to eq(false)
       end
       it 'should save successfully' do
         user = User.new(anonymous_username:'jeanmichel', password:'bonjour', email:'jm@gossip.fr', secret_code:"THP").save
         expect(user).to eq(true)
       end
       #test de l'unicité de l'email
       it 'ensures email uniqueness' do
         user = User.new(anonymous_username:'jeanmichel', password:'bonjour', email:'jm@gossip.fr', secret_code:"THP").save
         user = User.new(anonymous_username:'jeanmichel2', password:'bonjour', email:'jm@gossip.fr', secret_code:"THP").save
         expect(user).to eq(false)
       end
  end
end
