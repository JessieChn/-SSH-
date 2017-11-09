package cn.edu.zjut.dao;
import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;
import java.util.ArrayList;
import java.util.List;

public interface ICustomerDAO {
       void save(Customer transientInstance);
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
       
}

