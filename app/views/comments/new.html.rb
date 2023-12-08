<section class="container mt-4">
<div class="row justify-content-center align-items-center">
<div class="col-6 border border-dark">
<h1 class="text-center">Comment</h1>
  <% if flash[:error].present? %>
    <div class="alert alert-danger">
  <%=flash[:error] %>
    </div>
    <% end %>

    <%= form_with(model: @comment, url: user_post_comments_path(@user, @post)) do |form| %>

      <div class="form-group">
      <%= form.label :body, class: "form-control" %>
      </div>
      <div class="form-group mt-2">
      <%= form.submit "Create Post", class: "btn btn-primary" %>
      </div>
      <% end %>
    </div>
  </div>
</section>