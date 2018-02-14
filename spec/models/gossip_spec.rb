require 'rails_helper'

RSpec.describe Gossip, type: :model do
  context 'validation tests Gossip' do
       it 'should save when anonymous_username writes a gossip' do
         user = User.create(anonymous_username:'jeanmichel', password:'bonjour', email:'jm3@gossip.fr', id:36, secret_code:"THP").save
         gossip = Gossip.new(content:"Oh la la !", user_id:36).save
         expect(gossip).to eq(true)
       end

       it 'control when where is non anonymous_username' do
         user = User.create(anonymous_username:'jeanmichel', password:'bonjour', email:'jm3@gossip.fr', id:36).save
         gossip = Gossip.new(content:"Oh la la !").save
         expect(gossip).to eq(false)
       end

  end
end
