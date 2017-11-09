package cn.edu.zjut.dao;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;
import cn.edu.zjut.po.Order;

public class CustomerDAO extends BaseHibernateDAO implements ICustomerDAO{
	
	public CustomerDAO(){
		System.out.println("Create CustomerDao");
	}
	public void save(Customer transientInstance){
		Transaction tran = null;
		Session session = null;
		try{
			session = getSession();
			tran = session.beginTransaction();
			session.save(transientInstance);
			/*session.delete(cus);*/
			Customer cus = (Customer)session.get(transientInstance.getClass(),1);
		
		    System.out.println("姓名为："+cus.getAccount());
		    tran.commit();
		}
		catch(RuntimeException re){
			if(tran!=null) tran.rollback();
			throw re;
		}
		finally{
			session.close();
		}
	}
	public Boolean login(Customer transientInstance){
		Transaction tran = null;
		Session session = null;
		String hql = "from Customer where account = ? and password = ?";
	    session = getSession();
		tran = session.beginTransaction();
        Query query = session.createQuery(hql);
        
        query.setParameter(0,transientInstance.getAccount());
        query.setParameter(1,transientInstance.getPassword());
	    query.setMaxResults(1);
	    List<Customer> list = query.list();
		  Iterator its=list.iterator();  
		  while(its.hasNext()){  
		   Customer customer=(Customer)its.next();  		   
		   System.out.println("注册函数"+~~customer.getCustomerId()); 
		   return true;
		  }  
		  return false;
		
		
	}
		
		public List get(){
			/*Customer cus = new Customer();
			cus.setAccount("vvv");*/
			Transaction tran = null;
			Session session = null;
			List<Customer> list;
			try{
				System.out.println("dao层"); 
				session = getSession();
				tran = session.beginTransaction();
				  String hql="from Customer";  
				  Query query=session.createQuery(hql);  
				  list= query.list();
/*				  HttpServletRequest request=ServletActionContext.getRequest();
			      request.setAttribute("CustomerInfo", list);*/
				  Iterator its=list.iterator();  
				  while(its.hasNext()){  
				   Customer customer=(Customer)its.next();  
				   System.out.println(customer.getCustomerId());  
				   System.out.println(customer.getAccount()); 
				  }  
				  System.out.println("dao层"); 
				tran.commit();		
			}
			catch(RuntimeException re){
				if(tran!=null) tran.rollback();
				throw re;
			}
			finally{
				session.close();
		
			}
			return list;
		}
		
		public List getById(String id) {
			Transaction tran = null;
			Session session = null;
			List<Customer> list;
			Customer customer = null;
			try{
				System.out.println("dao层"); 
				session = getSession();
				tran = session.beginTransaction();
				  String hql="from Customer where customerID = ?";  
				  Query query=session.createQuery(hql);  
				  query.setParameter(0, id);
				  list= query.list();
				  
				tran.commit();		
			}
			catch(RuntimeException re){
				if(tran!=null) tran.rollback();
				throw re;	
			}
			finally{
				session.close();
		
			}
			return list;
		}
		public void update(Customer transientInstance) {
			Transaction tran = null;
			Session session = null;
			List<Customer> list;
			Customer customer = null;
			try{
				System.out.println("dao层"); 
				session = getSession();
				tran = session.beginTransaction();
				  String hql="update Customer c set c.account=?,"
				  		+ "c.password=?,"
				  		+ "c.name=?,"
				  		+ "c.sex=?,"
				  		+ "c.birthday=?,"
				  		+ "c.phone=?,"
				  		+ "c.email=?,"
				  		+ "c.address=?,"
				  		+ "c.zipcode=?,"
				  		+ "c.fax=?"
				  		+ " where customerID = ?";  
				  Query query=session.createQuery(hql);  
				  query.setParameter(0,transientInstance.getAccount());
				  query.setParameter(1,transientInstance.getPassword());
				  query.setParameter(2,transientInstance.getName());
				  query.setParameter(3,transientInstance.getSex());
				  query.setParameter(4,transientInstance.getBirthday());
				  query.setParameter(5,transientInstance.getPhone());
				  query.setParameter(6,transientInstance.getEmail());
				  query.setParameter(7,transientInstance.getAddress());
				  query.setParameter(8,transientInstance.getZipcode());
				  query.setParameter(9,transientInstance.getFax());
				  query.setParameter(10,transientInstance.getCustomerId());
				  query.executeUpdate();
/*				  Order order = new Order();
				  order.setCustomer(transientInstance);
				  session.save(order);*/
				tran.commit();		
			}
			catch(RuntimeException re){
				if(tran!=null) tran.rollback();
				throw re;	
			}
			finally{
				session.close();
				
		
			}
			
			
		}
		@Override
		public void delete(String id) {
			Transaction tran = null;
			Session session = null;
	        Customer customer = new Customer();
	        customer.setCustomerId(Integer.parseInt(id));          
	        session = this.getSession();  
	        tran = session.beginTransaction();  
	        session.delete(customer);  
	        tran.commit();
			
		}
		@Override
		public void bookAdd(Book book) {
			Transaction tran = null;
			Session session = null;
	        session = getSession();
	        tran = session.beginTransaction();
	        book.setName("汉语口语");
			session.save(book);
			tran.commit();
			session.close();
		}
		@Override
		public List bookEdit(String id) {
			Transaction tran = null;
			Session session = null;
			List<Book> list;
			session = getSession();
			tran = session.beginTransaction();
			String hql="from Book where id = ?";  
			Query query=session.createQuery(hql);  
			query.setParameter(0, Integer.parseInt(id));
			list= query.list();
			tran.commit();		
		    session.close();
		    return list;
		}
		@Override
		public void bookUpdate(Book book) {
			Transaction tran = null;
			Session session = null;
	        session = getSession();
		    tran = session.beginTransaction();
		    String hql="update Book b set b.name=?,"
				  		+ "b.description=?, "
				  		+ "b.price=?, "
				  		+ "b.press=?, "
				  		+ "b.writerLocation=?, "
				  		+ "b.type=?, "
				  		+ "b.writer=? "
				  		+ " where id=?";  
		   Query query=session.createQuery(hql);  
		   query.setParameter(0,book.getName());
		   query.setParameter(1,book.getDescription());
		   query.setParameter(2,book.getPrice());
		   query.setParameter(3,book.getPress());
		   query.setParameter(4,book.getWriterLocation());
		   query.setParameter(5,book.getType());
		   query.setParameter(6,book.getWriter());
		   query.setParameter(7,book.getId());
		   query.executeUpdate();
		   tran.commit();		
		   session.close();
		}
		@Override
		public void bookDelete(String id) {
			// TODO 自动生成的方法存根
			Transaction tran = null;
			Session session = null;
	        Book book = new Book();
	        book.setId(Integer.parseInt(id));       
	        session = this.getSession();  
	        tran = session.beginTransaction();  
	        session.delete(book);  
	        tran.commit();
			
		}
		@Override
		public List getBookById(String id) {
			// TODO 自动生成的方法存根
			return null;
		}
		@Override
		public List getBookList() {
			Transaction tran = null;
			Session session = null;
			List<Book> list;
			session = getSession();
		    tran = session.beginTransaction();
		    String hql="from Book";  
			Query query=session.createQuery(hql);  
		    list= query.list();
			tran.commit();		
			session.close();
		    return list;
		}
	

}
