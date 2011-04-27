Then /^the existing order should have total at "([^"]*)"$/ do |total|
  Order.first.total.to_f.should == total.to_f
end

Then /^the existing order should not have any promotion credits$/ do
  Order.first.adjustments.promotion.count.should == 0
end

Then /^the existing order should have (\d+) promotion credit$/ do |count|
  Order.first.adjustments.promotion.count.should == count.to_i
end

When /^I update the quantity on the first cart item to "([^"]*)"$/ do |quantity|
  When( %(I fill in "order[line_items_attributes][0][quantity]" with "#{quantity}") )
  And(%(I follow "Update") )
end


