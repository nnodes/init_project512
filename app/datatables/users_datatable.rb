class UsersDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view
  include Rails.application.routes.url_helpers

  def initialize(view, options = {})
    @view = view
    @action = options[:action]
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.count,
      iTotalDisplayRecords: users.total_entries,
      aaData: data
    }
  end

  private

  def data
    users.map do |user|
      array = []
      array << user.id
      array << user.email
      array << (user.active ? 'Sí' : 'No')
      array << link_to('Ver', admin_user_path(user), class: 'btn btn-xs btn-success')+" "+link_to('Editar', edit_admin_user_path(user), class: 'btn btn-xs btn-warning')+" "+link_to('Eliminar', admin_user_path(user), method: :delete, data: { confirm: '¿Estás seguro que deseeas eliminar este usuario?' }, class: 'btn btn-xs btn-danger')
      array
    end
  end

  def roles(user)
    result = ''
    user.roles.each_with_index do |r, i|
      result << ', ' if i > 0
      result << r.name.humanize
    end
    result
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.order("#{sort_column} #{sort_direction}").page(page).per_page(per_page)
    if params[:sSearch].present?
      users = users.where("CAST( users.id AS TEXT) ILIKE :search OR email ILIKE :search", search: "%#{params[:sSearch]}%")
    end
    users
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = ['users.id', 'users.email', 'users.active', '']
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
