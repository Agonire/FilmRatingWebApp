package data.dao.comment;

import data.hibernate.entity.Comment;

import java.util.List;

public interface ICommentDAO {
    List<Comment> getComments();
    void createComment(Comment comment);
    void removeComment(Comment comment);
}
