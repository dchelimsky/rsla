module AccountsHelper
  def link_to_account(account)
    %Q{<a href="/accounts/#{account.id}">#{account.name}'s account</a>}
  end
end
