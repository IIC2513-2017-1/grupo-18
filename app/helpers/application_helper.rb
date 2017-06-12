module ApplicationHelper
  def currency_field
  { autonumeric: { aSign: '$ ', 'aPad' => false } }
  end
  def different_user?
    current_user.id != @user.id
  end
end
