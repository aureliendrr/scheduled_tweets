module ApplicationHelper
  def active_link_class(path)
    request.path.starts_with?(path) ? "bg-gray-100 dark:bg-neutral-700 text-gray-800 dark:text-white" : ""
  end

  def user_full_name(user)
    "#{user.first_name} #{user.last_name}"
  end
end
