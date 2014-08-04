class Contact < ActiveRecord::Base

	validates :first_name, :presence => { :message => "Please enter a First Name"},
						length: {minimum: 1,  maximum: 35
						}
						

	validates :middle_name, allow_blank:true,
						length: {minimum: 1,  maximum: 35
						}
	validates :last_name, :presence => { :message => "Please enter a Last Name"},
						length: {minimum: 1,  maximum: 35
						}

	validates :email, :presence => { :message => "Please enter an Email"},
					  length: {minimum: 1,  maximum: 255 },
					  :uniqueness => { :message => "That email is already in the database ", case_sensitive: false },
					  format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/,
                      message: "Please enter a valid email"}

    validates :state, allow_blank:true ,length: {minimum: 1,  maximum: 40}

    validates :city, allow_blank:true ,length: {minimum: 1,  maximum: 40}

    validates :postal_code, allow_blank:true ,length: {minimum: 1,  maximum: 20}

    validates :country, allow_blank:true ,length: {minimum: 1,  maximum: 40}
    
    
#    validate :must_have_email_or_phone

    # def must_have_email_or_phone
    # 	if !email.present? && !phone_number.present?
    # 		 errors.add(:email, "Please enter an Email or Phone Number")
    # 	end
    # end

end
