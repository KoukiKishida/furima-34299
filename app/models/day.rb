class Day < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '１〜2日で発送' },
    { id: 3, name: '２〜3日で発送' },
    { id: 4, name: '4〜7日で発送' }
  ]
  include ActiveHash::Associations
  has_many :products
end
