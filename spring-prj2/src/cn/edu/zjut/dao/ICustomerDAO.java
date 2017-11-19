package cn.edu.zjut.dao;
import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;
import cn.edu.zjut.po.Order;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public interface ICustomerDAO {
       void save(Customer transientInstance);
       void orderAdd(Order order) throws ParseException;
       List get();
       List getById(String id);
       void update(Customer transientInstance);
       void delete(String id);
	   Boolean login(Customer transientInstance);
	   void bookAdd(Book book);
	   List bookEdit(String id);
	   void bookUpdate(Book book);
	   void bookDelete(String id);
	   List getBookById(String id);
	   List getBookList();
       public List<Customer> findForPageForUser(String hql, int off, int len);
	   public int findAllRowCountsForUser(String hql);
	   void adminUpgrade(String id);
	   void adminDegrade(String id);
	   List orderListAd();
	   List orderList(String id);
}

