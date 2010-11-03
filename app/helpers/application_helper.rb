module ApplicationHelper
  ###
  # * If array is passed, 'selected' is returned if
  #   current controller name is included in the arr.
  #
  # * If a symbol and a string are passed, then
  #   the symbol is used to key the params object
  #   and compare that value with the given string.
  #    - An options hash can be passed with key :default. If
  #      :default is true, 'selected' will be returned if 
  #      the key returns blank (no tab is selected).
  ###
  def tab_selected?(*args)
    if args.first.instance_of? Symbol
      return 'selected' if params[args.first] == args[1].to_s || 
        (params[args.first].blank? && args.last.instance_of?(Hash) && args.last[:default])
    else
      return 'selected' if args.include?(controller.controller_name) 
    end
  end
end
