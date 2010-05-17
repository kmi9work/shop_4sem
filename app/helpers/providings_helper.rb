module ProvidingsHelper
  def provider_select(name, default = nil)
    ps = Provider.find(:all, :order => 'name').map{ |p| [p.name, p.id.to_s] }
    select_tag(name, options_for_select(ps, default))
  end
end
