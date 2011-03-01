Factory.define :user do |user|
  user.name "admin"
  user.password "password"
  user.password_confirmation "password"
end

Factory.define :member do |member|
  member.name "Test Member"
  member.pclass "Priest"
end

Factory.define :item do |item|
  item.name "Test Item"
  item.link "#"
  item.boss "Test Boss"
  item.date Time.now
  item.association :member
end