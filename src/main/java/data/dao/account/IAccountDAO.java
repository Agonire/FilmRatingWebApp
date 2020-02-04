package data.dao.account;

import data.hibernate.entity.Account;
import data.hibernate.entity.Comment;

import java.util.List;

public interface IAccountDAO {
    Account getAccount(int id);
    List<Account> getAccounts();
    List<Comment> getComments(Account account);
    void deleteAccount(int id);
    void deleteAccount(Account account);
    void createAccount(Account account);
}
