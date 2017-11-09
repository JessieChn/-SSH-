package cn.edu.zjut.service;


import java.util.List;

import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;

public interface IUserService {
	public void register(Customer transientInstance);
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

}
