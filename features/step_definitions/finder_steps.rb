# Fix for hidden elements
# https://github.com/jnicklas/capybara/issues#issue/81
Then /^(?:|I )should not find "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  wait_until do
    parent_hidden = page.evaluate_script(%{jQuery('#{selector}').find(':contains(#{text})').parents().is(':hidden');})
    its_hidden = page.evaluate_script("jQuery('#{selector}:contains(#{text})').is(':hidden');")
    its_not_in_dom = page.evaluate_script("jQuery('#{selector}:contains(#{text})').length == 0;")
    (parent_hidden || its_hidden || its_not_in_dom)
  end
end

# Work around for capybara hidden/visible issues
# https://github.com/jnicklas/capybara/issues#issue/81
Then /^(?:|I )should not find visible selector "([^"]*)"$/ do |selector|
  wait_until do
    parent_hidden = page.evaluate_script(%{jQuery('#{selector}').parents().is(':hidden');})
    its_hidden = page.evaluate_script("jQuery('#{selector}').is(':hidden');")
    its_not_in_dom = page.evaluate_script("jQuery('#{selector}').length == 0;")
    (parent_hidden || its_hidden || its_not_in_dom)
  end
  parent_hidden = page.evaluate_script(%{jQuery('#{selector}').parents().is(':hidden');})
  its_hidden = page.evaluate_script("jQuery('#{selector}').is(':hidden');")
  its_not_in_dom = page.evaluate_script("jQuery('#{selector}').length == 0;")
  (parent_hidden || its_hidden || its_not_in_dom).should be_true
end

