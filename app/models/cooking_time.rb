class CookingTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '5〜10分'},
    { id: 3, name: '10~20分'},
    { id: 4, name: '20~30分'},
    { id: 5, name: '30分以上'}
  ]

  include ActiveHash::Associations
  has_many :recipes
end
