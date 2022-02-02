User.seed do |s|
  s.id = 1
  s.role = 'admin'
  s.name = '管理者'
  s.email = 'admin@example.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.confirmed_at = Time.zone.now
end
