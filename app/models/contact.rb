class Contact < ActiveRecord::Base

	validates :first_name, presence:true,
						length: {minimum: 1,  maximum: 35
						}
	validates :middle_name, allow_blank:true,
						length: {minimum: 1,  maximum: 35
						}
	validates :last_name, allow_blank:true,
						length: {minimum: 1,  maximum: 35
						}

	validates :email, allow_blank:true,
					  format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                      }

end