module Utilities
  def generate_random_email_address
    first_part = 'testabc'
    last_part = '@itl.com'
    middle_part = rand(1..100).to_s + (0...5).map { ('a'..'z').to_a[rand(5)] }.join
    first_part+middle_part+last_part
  end

  def generate_random_first_name
    first_part = 'firstnametest'
    last_part=(0...5).map { ('a'..'z').to_a[rand(5)] }.join
    first_part + last_part
  end

  def generate_random_surname_name
    first_part = 'surnametest'
    last_part=(0...5).map { ('a'..'z').to_a[rand(5)] }.join
    first_part + last_part
  end

  def generate_random_comments
    first_part = 'comment-'
    last_part=(0...10).map { ('a'..'z').to_a[rand(10)] }.join
    first_part + last_part
  end
end
