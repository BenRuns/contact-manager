class Contact < ActiveRecord::Base

	validates :first_name, :presence => { :message => "Please enter a First Name"},
						length: {minimum: 2,  maximum: 35
						}
						

	validates :middle_name, allow_blank:true,
						length: {minimum: 2,  maximum: 35
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

    validates :postal_code, allow_blank:true ,length: {minimum: 1,  maximum: 20 }, 
    		  format: { with: /(^\d{5}$)|(^\d{5}-\d{4}$)/ , if: "!country.nil? && country =~ /^US$|^USA$/", :message => "Please enter a valid US zip code"}



    validates :country, allow_blank:true ,length: {minimum: 2,  maximum: 40}
    		 
    validates :phone_number, allow_blank:true ,length: {minimum: 6,  maximum: 20},
    		  format: { with: /(^\d{3}\-\d{3}\-\d{4}$)/ , if: "!country.nil? && country =~ /^US$|^USA$/", :message => "Please enter a phone number in the NNN-NNN-NNNN format"}


    
    
#    validate :must_have_email_or_phone

    # def must_have_email_or_phone
    # 	if !email.present? && !phone_number.present?
    # 		 errors.add(:email, "Please enter an Email or Phone Number")
    # 	end
    # end

end
