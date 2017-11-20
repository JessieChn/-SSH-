package cn.edu.zjut.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import cn.edu.zjut.dao.ICustomerDAO;  //注意这里是导入接口
import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;
import cn.edu.zjut.po.Order;
import cn.edu.zjut.po.PageBean;

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
	public PageBean queryForPageForUser(int pageSize, int page) {
		// TODO 自动生成的方法存根
		String hql = "from Customer customer";
		int allRowCounts = customerDAO.findAllRowCountsForUser(hql);
		int curPage = PageBean.curPage(page);
		int curOffset = PageBean.curOffset(pageSize, curPage);
		int sumPages = PageBean.getSumPages(allRowCounts, pageSize);
		List<Customer> customers = customerDAO.findForPageForUser(hql, curOffset, pageSize);
		PageBean pageBean = new PageBean();
		pageBean.setAllRowCounts(allRowCounts);
		pageBean.setCurPage(curPage);
		pageBean.setSumPages(sumPages);
		pageBean.setCustomers(customers);
		return pageBean;
	}
	@Override
	public void orderAdd(Order order) throws ParseException {
		// TODO 自动生成的方法存根
		customerDAO.orderAdd(order);
		
	}
	public void adminUpgrade(String id){
		customerDAO.adminUpgrade(id);
	}
	public void adminDegrade(String id){
		customerDAO.adminDegrade(id);
	}
	@Override
	public List orderList(String id) {
		// TODO 自动生成的方法存根
		List list =  customerDAO.orderList(id);
		return list;
	}
	public ICustomerDAO getCustomerDAO() {
		return customerDAO;
	}
	@Override
	public List orderListAd() {
		// TODO 自动生成的方法存根
		List list =  customerDAO.orderListAd();
		return list;
	}
	public List getLog(){
		List list = customerDAO.getLog();
		return list;
	}
	@Override
	public void orderVerify(String id,String verify) {
		customerDAO.orderVerify(id,verify);
		
	}
	@Override
	public void orderStatu(String id, String statu) {
		// TODO 自动生成的方法存根
		customerDAO.orderStatu(id,statu);
		
	}
}
