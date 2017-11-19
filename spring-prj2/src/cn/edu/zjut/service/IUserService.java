package cn.edu.zjut.service;


import java.text.ParseException;
import java.util.List;

import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;
import cn.edu.zjut.po.Order;
import cn.edu.zjut.po.PageBean;

public interface IUserService {
	public void register(Customer transientInstance);
	public void orderAdd(Order order) throws ParseException;
	public List getCustomerInfo();
	public List getCustomerInfoById(String id);
	public void customerInfoUpdate(Customer transientInstance);
	public void customerInfoDelete(String id);
	public Boolean login(Customer loginUser);
	public void bookAdd(Book book);
	public List bookEdit(String id);
	public void bookUpdate(Book book);
	public void bookDelete(String id);
	public List getBookById(String id);
	public List getBookList();
	public void adminUpgrade(String id);
	public void adminDegrade(String id);
	public PageBean queryForPageForUser(int pageSize,int page);
	public List orderList(String id);
	public List orderListAd();
	
	

}
