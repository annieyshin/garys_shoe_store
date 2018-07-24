<tr>
  <% @store.brand_stores.each() do |brand|%>
  <td><%= brand.location%></td>
  <% end %>
</tr>
<tr>
  <% @store.brand_stores.each() do |brand|%>
  <td><%= brand.price%></td>
  <% end %>
</tr>


before_save(:number_to_currency_price)

def number_to_currency_price
  self.price=(price().number_to_currency(price, :unit => "$"))
end



    it("converts the brand shoe price to currency") do
      brand = Brand.create({:price => "50"})
      expect(brand.price()).to(eq("$50.00"))
    end

TAKE FROM STORE_SPEC.RB

      it { should have_many(:brands)}

      TAKE FROM BRAND_SPEC.RB

      it { should have_many(:stores)}
