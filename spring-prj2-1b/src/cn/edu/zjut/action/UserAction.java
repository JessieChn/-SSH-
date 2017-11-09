package cn.edu.zjut.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.zjut.po.*;
import cn.edu.zjut.service.*;

public class UserAction {
	private Book book;
	private Customer loginUser;
	private IUserService userService = null;
	private List lists;
	
	public List getLists() {
		return lists;
	}
	public void setLists(List lists) {
		this.lists = lists;
	}
	public void setUserService(IUserService userService){
		this.userService = userService;
		
	}
	public String register(){
		userService.register(loginUser);
/*		Book book = new Book();
		book.setId(1);
		book.setName("韩国口语");
		book.setPicture("1.jpg");
		book.setPress("清华大学出版社");
		book.setPrice(100);
		book.setType("灵异野史");
		book.setWriter("李东雨");
		book.setWriterLocation("韩国");
		userService.bookEdit(book);*/
		return "success";
	}
	public String login(){
		
		if(userService.login(loginUser))
		    return "success";
		else 
			return "false";
	}
	public Customer getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(Customer loginUser) {
		this.loginUser = loginUser;
	}
	public String getCustomerInfo(){
		//HttpServletRequest request=ServletActionContext.getRequest();
		lists = userService.getCustomerInfo();
		//request.setAttribute("CustomerInfo", list);
		Iterator its=lists.iterator();  
		while(its.hasNext()){  
		   Customer customer=(Customer)its.next();  
		   System.out.println(customer.getCustomerId());
		}
		
		System.out.println("Action类");
		return "success";
	}
	
	public String customerInforEdit(){
		String a = ServletActionContext.getRequest().getParameter("id");
        System.out.println(a);
        lists = userService.getCustomerInfoById(a);
		return "success";		
	}
	public String customerInforUpdater(){
		userService.customerInfoUpdate(loginUser);
		return "success";
	}
	public String customerInforDelete(){
		String a = ServletActionContext.getRequest().getParameter("id");
        System.out.println(a);
        userService.customerInfoDelete(a);
		return "success";			
	}
	public String bookAdd(){
		userService.bookAdd(book);
		return "success";
	}
	public String bookEdit(){
		String a = ServletActionContext.getRequest().getParameter("id");
		System.out.println(a);
		lists = userService.bookEdit(a);
		return "success";
	}
	public String bookUpdate(){
		userService.bookUpdate(book);
		return "success";
	}
	public String bookDelete(){
		String a = ServletActionContext.getRequest().getParameter("id");
        userService.bookDelete(a);
		return "success";
		
	}
	public String getBookList(){
		lists = userService.getBookList();
		return "success";
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
}
