package cn.edu.zjut.dao;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;
import cn.edu.zjut.po.Log;
import cn.edu.zjut.po.Order;

import com.opensymphony.xwork2.ActionContext;

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
			Log log = new Log("ID号为"+transientInstance.getCustomerId()+"的新用户"
			                 +transientInstance.getName()+"刚刚注册成为了书子网会员");
			session.save(log);
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
		   Map<String, Object> loginSession = ActionContext.getContext().getSession();
		   loginSession.put("loginedUser",customer.getName());
		   loginSession.put("loginedUserId", customer.getCustomerId());
		   loginSession.put("loginedUserPer", customer.getPermission());
			Log log = new Log("ID号为"+customer.getCustomerId()+"的用户"
	                +customer.getName()+"刚刚成功登陆了书子网");
	        session.save(log);
	        tran.commit();
           
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
					Log log = new Log("ID号为"+transientInstance.getCustomerId()+"的用户"
			                +transientInstance.getName()+"刚刚成功修改了用户信息");
			        session.save(log);
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
			Log log = new Log("ID号为"+customer.getCustomerId()+"的用户"+
	                "刚刚被删除了用户信息");
	        session.save(log);
	        tran.commit();
			
		}
		@Override
		public void bookAdd(Book book) {
			Transaction tran = null;
			Session session = null;
	        session = getSession();
	        tran = session.beginTransaction();
			session.save(book);
			Log log = new Log("ID号为"+book.getId()+"的图书:"+book.getName()+
					" 详细信息:"+book.getDescription()+
					" 价钱:"+book.getPrice()+
	                "刚刚添加进了书子网");
	        session.save(log);
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
			Log log = new Log("ID号为"+id+"的图书信息"+
	                "刚刚被图书管理员浏览了");
	        session.save(log);
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
			Log log = new Log("ID号为"+book.getId()+"的图书:"+book.getName()+
	                "刚刚被图书管理员更新了");
	        session.save(log);
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
			Log log = new Log("ID号为"+id+"的图书"+
	                "刚刚被图书管理员删除了");
	        session.save(log);
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
		    int count = query.list().size();
		    System.out.println(count);
			tran.commit();		
			session.close();
		    return list;
		}
		@Override
		public List<Customer> findForPageForUser(String hql, int off, int len) /*{
			Session session = this.getSessionFactory().openSession();
			
			Query query = session.createQuery(hql);
			query.setFirstResult(off);
			query.setMaxResults(len);
			List<Customer> customers = query.list();
			session.close();
			return customers;
		}*/
		{
			boolean[] siftornot = {true,true,true,true,true,true,true,true,true,true,true};
			Query query = null;
			Map<String,String> map = new HashMap<String, String>();
			String fcas = "",fcps = "",fcns = "",fcss = "",fcbs ="",fcps2 = "",fces= "",fcas2="",fczs="",fcfs="",fcps3=""; //filter customer 
			Session session = this.getSession();
			Map<String, Object> httpSession =  ActionContext.getContext().getSession();
			Object fca =  httpSession.get("account_s");
			Object fcp =  httpSession.get("password_s");
			Object fcn =  httpSession.get("name_s");
			Object fcs =  httpSession.get("sex_s");
			Object fcb =  httpSession.get("birthday_s");
			Object fcp2 =  httpSession.get("phone_s");
			Object fce =  httpSession.get("email_s");
			Object fca2 =  httpSession.get("address_s");
			Object fcz =  httpSession.get("zipcode_s");
			Object fcf =  httpSession.get("fax_s");
			Object fcp3 =  httpSession.get("permission_s");

			if((fca==null||fca.equals("")))
				siftornot[0] = false;
			if((fcp==null||fcp.equals("")))
				siftornot[1] = false;
			if((fcn==null||fcn.equals("")))
				siftornot[2] = false;
			if((fcs==null||fcs.equals("")))
				siftornot[3] = false;
			if(fcb==null||fcb.equals(""))
				siftornot[4] = false;
			if((fcp2==null||fcp2.equals("")))
				siftornot[5] = false;
			if((fce==null||fce.equals("")))
				siftornot[6] = false;
			if((fca2==null||fca2.equals("")))
				siftornot[7] = false;
			if((fcz==null||fcz.equals("")))
				siftornot[8] = false;
			if(fcf==null||fcf.equals(""))
				siftornot[9] = false;
			if((fcp3==null||fcp3.equals("")))
				siftornot[10] = false;
			fcas = (String)fca;
			fcps = (String)fcp;
			fcns = (String)fcn;
			fcss = (String)fcs;
			fcbs = (String)fcb;
			fcps2 = (String)fcp2;
			fces= (String)fce;
			fcas2 = (String)fca2;
			fczs = (String)fcz;
			fcfs = (String)fcf;
			fcps3= (String)fcp3;
			hql = hql + " where 1=1 ";
			String account=" and account like :account ";
			String password=" and password like :password ";
			String name=" and name like :name ";
			String sex=" and sex like :sex ";
			String birthday=" and birthday like :birthday ";

			String phone=" and phone like :phone ";
			String email=" and email like :email ";
			String address=" and address like :address ";
			String zipcode=" and zipcode like :zipcode ";
			String fax=" and fax like :fax ";

			String permission=" and permission like :permission ";
			if(siftornot[0]){
				hql = hql + account;
				map.put("account",fcas);
			}
			if(siftornot[1]){
				hql = hql + password;
				map.put("password",fcps);
	        }
		    if(siftornot[2]){
					hql = hql + name;
					map.put("name",fcns);
				}
			if(siftornot[3]){
			        hql = hql + sex;
			        map.put("sex",fcss);
				}
			if(siftornot[4]){
					hql = hql + birthday;
					map.put("birthday",fcbs);
				}
			if(siftornot[5]){
		        hql = hql + phone;
		        map.put("phone",fcps2);
			}
	     	if(siftornot[6]){
				hql = hql + email;
				map.put("email",fces);
			}
		   if(siftornot[7]){
	        hql = hql + address;
	        map.put("address",fcas2);
		}
	       if(siftornot[8]){
			hql = hql + zipcode;
			map.put("zipcode",fczs);
		}
	       if(siftornot[9]){
        hql = hql + fax;
        map.put("fax",fcfs);
	}
           if(siftornot[10]){
		hql = hql + permission;
		map.put("permission",fcps3);
	}
				query = session.createQuery(hql);
				
				
				Set<String> keySet = map.keySet();
				java.util.Iterator<String> it = keySet.iterator();
				while(it.hasNext()){
					Object key = it.next();
					String keys = key.toString();
					Object value = map.get(key);
					query.setParameter(keys, "%" + value + "%");
					
				}
				query.setFirstResult(off);
				query.setMaxResults(len);
				List<Customer> customers = query.list();
	        return customers;
		}
		@Override
		public int findAllRowCountsForUser(String hql) /*{
			Session session = this.getSession();
	        Query query = session.createQuery(hql);
	        return query.list().size();
		}*/
		
		{
			boolean[] siftornot = {true,true,true,true,true,true,true,true,true,true,true};
			Query query = null;
			Map<String,String> map = new HashMap<String, String>();
			String fcas = "",fcps = "",fcns = "",fcss = "",fcbs ="",fcps2 = "",fces= "",fcas2="",fczs="",fcfs="",fcps3=""; //filter customer 
			Session session = this.getSession();
			Map<String, Object> httpSession =  ActionContext.getContext().getSession();
			Object fca =  httpSession.get("account_s");
			Object fcp =  httpSession.get("password_s");
			Object fcn =  httpSession.get("name_s");
			Object fcs =  httpSession.get("sex_s");
			Object fcb =  httpSession.get("birthday_s");
			Object fcp2 =  httpSession.get("phone_s");
			Object fce =  httpSession.get("email_s");
			Object fca2 =  httpSession.get("address_s");
			Object fcz =  httpSession.get("zipcode_s");
			Object fcf =  httpSession.get("fax_s");
			Object fcp3 =  httpSession.get("permission_s");


			if((fca==null||fca.equals("")))
				siftornot[0] = false;
			if((fcp==null||fcp.equals("")))
				siftornot[1] = false;
			if((fcn==null||fcn.equals("")))
				siftornot[2] = false;
			if((fcs==null||fcs.equals("")))
				siftornot[3] = false;
			if(fcb==null||fcb.equals(""))
				siftornot[4] = false;
			if((fcp2==null||fcp2.equals("")))
				siftornot[5] = false;
			if((fce==null||fce.equals("")))
				siftornot[6] = false;
			if((fca2==null||fca2.equals("")))
				siftornot[7] = false;
			if((fcz==null||fcz.equals("")))
				siftornot[8] = false;
			if(fcf==null||fcf.equals(""))
				siftornot[9] = false;
			if((fcp3==null||fcp3.equals("")))
				siftornot[10] = false;
			fcas = (String)fca;
			fcps = (String)fcp;
			fcns = (String)fcn;
			fcss = (String)fcs;
			fcbs = (String)fcb;
			fcps2 = (String)fcp2;
			fces= (String)fce;
			fcas2 = (String)fca2;
			fczs = (String)fcz;
			fcfs = (String)fcf;
			fcps3= (String)fcp3;
			hql = hql + " where 1=1 ";
			String account=" and account like :account ";
			String password=" and password like :password ";
			String name=" and name like :name ";
			String sex=" and sex like :sex ";
			String birthday=" and birthday like :birthday ";

			String phone=" and phone like :phone ";
			String email=" and email like :email ";
			String address=" and address like :address ";
			String zipcode=" and zipcode like :zipcode ";
			String fax=" and fax like :fax ";

			String permission=" and permission like :permission ";
			if(siftornot[0]){
				hql = hql + account;
				map.put("account",fcas);
			}
			if(siftornot[1]){
				hql = hql + password;
				map.put("password",fcps);
	        }
		    if(siftornot[2]){
					hql = hql + name;
					map.put("name",fcns);
				}
			if(siftornot[3]){
			        hql = hql + sex;
			        map.put("sex",fcss);
				}
			if(siftornot[4]){
					hql = hql + birthday;
					map.put("birthday",fcbs);
				}
			if(siftornot[5]){
		        hql = hql + phone;
		        map.put("phone",fcps2);
			}
	     	if(siftornot[6]){
				hql = hql + email;
				map.put("email",fces);
			}
		   if(siftornot[7]){
	        hql = hql + address;
	        map.put("address",fcas2);
		}
	       if(siftornot[8]){
			hql = hql + zipcode;
			map.put("zipcode",fczs);
		}
	       if(siftornot[9]){
        hql = hql + fax;
        map.put("fax",fcfs);
	}
           if(siftornot[10]){
		hql = hql + permission;
		map.put("permission",fcps3);
	}
				query = session.createQuery(hql);
				Set<String> keySet = map.keySet();
				java.util.Iterator<String> it = keySet.iterator();
				while(it.hasNext()){
					Object key = it.next();
					String keys = key.toString();
					Object value = map.get(key);
					query.setParameter(keys, "%" + value + "%");
					
				}
			
			
				
	        return query.list().size();
		}
		@Override
		public void orderAdd(Order order) throws ParseException {
			// TODO 自动生成的方法存根
			Transaction tran = null;
			Session session = null;
	        session = getSession();
	        tran = session.beginTransaction();
	        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	        String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间 
	        System.out.println(datetime);
	        java.util.Date date=sdf.parse(datetime); 
	        System.out.println(date);
	        order.setSubmitTime(date);
			session.save(order);
			Customer customer = order.getCustomer();
			Log log = new Log("ID号为"+customer.getCustomerId()+"的用户:"+customer.getName()+
	                "刚刚在书子网下了新订单,订单详细内容如下："+order.getOrderDescription());
	        session.save(log);
			tran.commit();
			session.close();
			
		}
		
		public void adminUpgrade(String id)  {
			Transaction tran = null;
			Session session = null;
	        session = getSession();
		    tran = session.beginTransaction();
		    String hql="update Customer c set c.permission=1 where customerID=?";
				  		 
		   Query query=session.createQuery(hql);  
		   query.setParameter(0,id);
		   query.executeUpdate();
			Log log = new Log("ID号为"+id+"的用户"+
	                "刚刚成功升级为管理员用户了");
	        session.save(log);
		   tran.commit();		
		   session.close();
		}
		
		public void adminDegrade(String id)  {
			Transaction tran = null;
			Session session = null;
	        session = getSession();
		    tran = session.beginTransaction();
		    String hql="update Customer c set c.permission=0 where customerID=?";
				  		 
		   Query query=session.createQuery(hql);  
		   query.setParameter(0,id);
		   query.executeUpdate();
			Log log = new Log("ID号为"+id+"的用户"+
	                "刚刚成功降级为普通用户了");
	        session.save(log);
	        
	       
		   tran.commit();	
		  
/*	多表查询 测试语句	   
 * query = session.createQuery("select o.customer from Order o,Customer c where c.customerId=o.customer.customerId and c.customerId=1");
		   int size = query.list().size();
		   List list = query.list();
		   Iterator its=list.iterator();  
		   while(its.hasNext()){  
			   Customer customer=(Customer)its.next();   
			   System.out.println(customer.getAccount()); 
			  }  */
		   //System.out.println("size"+size);
		   
		   session.close();
		}
		@Override
		public List orderListAd() {
			// TODO 自动生成的方法存根
			Transaction tran = null;
			Session session = null;
	        session = getSession();
		    tran = session.beginTransaction();
		    System.out.println("~~~~前");
		    Query query = session.createQuery("select o.orderId,o.orderPicSet, o.orderDescription,"
		    		+ "o.receiverName ,o.phoneNumber,o.address,o.wayToSend,o.submitTime,o.valiStatu,"
		    		+ "o.orderStatu"
		    		+ " from Order o,Customer c where c.customerId=o.customer.customerId");
		
		    List list = query.list();	
			System.out.println("~~~~"+list.size());
/*			Iterator its=list.iterator();  
			 while(its.hasNext()){  
				   String desc=(String)its.next();   
				   System.out.println(desc); 
				  }*/
				tran.commit();		
				session.close();
			return list;
			
			
		}
		@Override
		public List orderList(String id) {
			// TODO 自动生成的方法存根
			Transaction tran = null;
			Session session = null;
	        session = getSession();
		    tran = session.beginTransaction();
		    Query query = session.createQuery("select o from Order o,Customer c where c.customerId=o.customer.customerId and c.customerId=?");
		    query.setParameter(0,id);
		    List<Order> list = query.list();
			return list;
			
		}
	}





