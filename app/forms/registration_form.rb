class RegistrationForm
  include ActiveModel::Model

  attr_reader :company,
              :user

  attr_accessor :email,
                :password,
                :name,
                :password_confirmation

  delegate :email,
           :password,
           to: :user,
           prefix: true

  delegate :name,
           to: :company,
           prefix: true

validates_presence_of :user_email,
                      :user_password,
                      :password_confirmation

  def initialize
    @company = Company.new
    @user    = User.new
  end

  def submit(params={})
    @company.name  = params[:company_name] || name
    @user.email    = params[:email] || email
    @user.password = params[:password] || password
    @user.password_confirmation = params[:password_confirmation] || password_confirmation
    @user.company  = @company

    unless @user.valid? && @user.save
      @user.errors.full_messages.each do |msg|
        if msg == 'Company is invalid'
          errors[:base] << @user.company.errors.full_messages
        else
          errors[:base] << msg
        end
      end
      return false
    end
    @user
  end
end
