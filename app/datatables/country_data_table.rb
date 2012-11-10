# http://railscasts.com/episodes/340-datatables
class CountryDataTable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Country.count,
      iTotalDisplayRecords: countries.total_entries,
      aaData: data
    }
  end

  private

  def countries
    @countries ||= fetch_countries
  end

  def fetch_countries
    countries = Country.order("#{sort_column} #{sort_direction}")
    countries = countries.page(page).per_page(per_page)
    if params[:sSearch].present?
      countries = countries.where("name like :search or continent like :search", search: "%#{params[:sSearch]}%")
    end
    countries
  end

  def data
    countries.map do |country|
      country.attributes.values
    end
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id continent name region surface_area population local_name capital internet_code]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
