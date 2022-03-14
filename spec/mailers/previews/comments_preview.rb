# Preview all emails at http://localhost:3000/rails/mailers/comments
class CommentsPreview < ActionMailer::Preview

  # Preview this email at
  def submitted
    CommentsMailer.submitted.Comment.first
  end

end
