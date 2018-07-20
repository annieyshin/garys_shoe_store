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
