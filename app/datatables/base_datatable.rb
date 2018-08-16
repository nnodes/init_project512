class BaseDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view, options = {})
    @view = view
    @action = options[:action]
    @klass = nil
    @delete_confirmation = nil
  end

  def as_json(_options = {})
    raise 'Base class is not defined' if @klass.nil?
    raise 'Objects not defined' if @objects.nil?
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: @klass.count,
      iTotalDisplayRecords: @objects.total_entries,
      aaData: data
    }
  end

  private

  def data
    raise NotImplementedError,
          'data method should be declared by inheriting class'
  end

  def page
    params[:iDisplayStart].to_i / per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i.positive? ? params[:iDisplayLength].to_i : 10
  end

  def crud_buttons(object, options = { except: [] })
    buttons = ''
    buttons += "#{show_button(object)} " unless options[:except].include?(:show)
    buttons += "#{edit_button(object)} " unless options[:except].include?(:edit)
    unless options[:except].include?(:delete)
      buttons += "#{delete_button(object)} "
    end
    buttons
  end

  def delete_button(object)
    raise 'Delete confirmation message not defined' if @delete_confirmation.nil?
    delete_path = url_helpers.send("admin_#{@klass.to_s.downcase}_path",
                                   id: object.id)
    link_to('Eliminar', delete_path,
            method: :delete,
            data: { confirm: @delete_confirmation },
            class: btn_classes + 'btn-danger')
  end

  def edit_button(object)
    edit_path = "edit_admin_#{@klass.to_s.downcase}_path"
    link_to('Editar', url_helpers.send(edit_path, id: object.id),
            class: btn_classes + 'btn-warning')
  end

  def fetch_objects
    @klass.order("#{sort_column} #{sort_direction}").page(page)
          .per_page(per_page)
  end

  def show_button(object)
    link_to('Ver', url_helpers.send("admin_#{@klass.to_s.downcase}_path",
                                    id: object.id),
            class: btn_classes + 'btn-success')
  end

  def sort_column
    raise 'Columns not implemented' if @columns.nil?
    @columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == 'desc' ? 'desc' : 'asc'
  end

  def url_helpers
    Rails.application.routes.url_helpers
  end

  def btn_classes
    'btn btn-xs '
  end
end