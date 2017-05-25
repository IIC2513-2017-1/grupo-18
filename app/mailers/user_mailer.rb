class UserMailer < ActionMailer::Base
  include ApplicationHelper
  # include SendGrid
  default from: 'from@example.com'
  layout 'mailer'

  $contact_email = "contacto@comunidadfeliz.cl"
  default from: 'g18@7c6b7ee0ea7a963eb5130521df2996a8635d2901.com'





  def welcome(user, locale = :es)
    @locale = locale
    @user = user
    token = @user.tokens.first_or_create
    @token = token.value

    @title = "Hola, #{@user.first_name}!"
    @subtitle = "Gracias por registrarte a nuestro sitio."
    @url  = $site_url+"/activate/#{@token}"

    @unsubscribe_token = @user.tokens.first_or_create.value
    mail(to: @user.email, subject: "Welcome")
  end


  def contact_email(name, email, subject, content, phone, rol, locale = :es)
    @locale = locale
    @name = name
    @email = email
    @phone = phone
    @rol = rol
    @subject = subject
    @content = content
    @user = User.new

    @title = "Hola administradores."
    @subtitle= "Se les ha enviado un correo de feedback"

    @url  = $site_url

    mail(to: $contact_email, subject: "Contacto - #{@name}")
  end


  def recover_pass(user, token, locale = :es)
    @locale = locale
    @user = user
    @token = token
    @url  = $site_url+"/change_password/"+@token
    @title = "Hola, #{@user.first_name}!"

    @unsubscribe_token = @user.tokens.first_or_create.value
    mail(to: user.email, subject: "Cambiar la contraseña")
  end

  def first_password(admin, user, community, token, locale = :es)
    @locale = locale
    @user = user
    @admin = admin
    @token = token
    @community = community
    @url  = $site_url+"/change_password/"+@token

    @title = "Hola #{@user.first_name},"
    @subtitle = "Gracias por ser parte de Comunidad Feliz"

    @unsubscribe_token = @user.tokens.first_or_create.value
    mail(to: user.email, subject: "Configura tu contraseña en Comunidad Feliz - Gastos Comunes", from: community.contact_email)
  end

end
