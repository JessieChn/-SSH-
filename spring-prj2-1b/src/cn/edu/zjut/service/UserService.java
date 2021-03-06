package cn.edu.zjut.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import cn.edu.zjut.dao.ICustomerDAO;  //注意这里是导入接口
import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;

public class UserService implements IUserService{
	private ICustomerDAO customerDAO = null;
	public UserService(){
		System.out.println("Create UserService");
	}
	public void setCustomerDAO(ICustomerDAO customerDAO){
		System.out.println("--setCustomerDAO--");
		this.customerDAO = customerDAO;
	}
	public void register(Customer transientInstance){
		System.out.println("execute --register()--method--");
		customerDAO.save(transientInstance);
	}
	public Boolean login(Customer transientInstance){
		System.out.println("execute --login()--method--");
		Boolean flag = customerDAO.login(transientInstance);
		return flag;
	}
	
	public List getCustomerInfo() {
		System.out.println("execute --getCustomerInfo--method--");
	    List list = customerDAO.get();
		Iterator its=list.iterator();  
		while(its.hasNext()){  
		   Customer customer=(Customer)its.next();  
		   System.out.println(customer.getCustomerId());
		}
		System.out.println("Service层");
		return list;
		
	

	}
	public List getCustomerInfoById(String id) {
		List list = customerDAO.getById(id);
		return list;
	}
	public void customerInfoUpdate(Customer transientInstance) {
		customerDAO.update(transientInstance);
		
	}
	public void customerInfoDelete(String id) {
		customerDAO.delete(id);
		
	}
	@Override
	public void bookAdd(Book book) {
		// TODO 自动生成的方法存根
		customerDAO.bookAdd(book);
		
	}
	@Override
	public List bookEdit(String id) {
		// TODO 自动生成的方法存根
		List list = customerDAO.bookEdit(id);
		return list;
		
	}
	@Override
	public void bookDelete(String id) {
		// TODO 自动生成的方法存根
		customerDAO.bookDelete(id);
	}
	@Override
	public List getBookById(String id) {
		// TODO 自动生成的方法存根
		return null;
	}
	@Override
	public List getBookList() {
		// TODO 自动生成的方法存根
		List list = customerDAO.getBookList();
		return list;
	}
	@Override
	public void bookUpdate(Book book) {
		customerDAO.bookUpdate(book);
		
	}
}
