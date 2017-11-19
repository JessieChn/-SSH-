package cn.edu.zjut.action;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.edu.zjut.po.*;
import cn.edu.zjut.service.*;

public class UserAction extends ActionSupport {
	private Book book;
	private Customer loginUser;
	private IUserService userService = null;
	private List lists;
	private List<Order> orders;
	private ArrayList listP = new ArrayList();
    public void setListP(ArrayList listP) {
		this.listP = listP;
	}

	private File upload;// 上传的文件
    private String uploadFileName;//上传的文件名陈
    private PageBean pageBean;
    private List<Customer> customers; 
    private Order order = new Order();
    private int page = 1;
    
	
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public IUserService getUserService() {
		return userService;
	}
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
	public String loginOut(){
		Map<String, Object> loginSession =  ActionContext.getContext().getSession();
		loginSession.remove("loginedUser");
		loginSession.remove("loginedUserId");
		loginSession.remove("loginedUserPer");
		return "success";
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
        System.out.println(a+"~~~~");
        Map<String, Object> loginSession =  ActionContext.getContext().getSession();
        //System.out.println(loginSession.get("loginedUserId")+"~~~~");
        lists = userService.getCustomerInfoById(a);
        if(loginSession.get("loginedUserId").toString().equals(a)||loginSession.get("loginedUserPer").toString().equals("1")){
        	
        	System.out.println(loginSession.get("loginedUserId")+"~~~~");
        	return "success";
        }
		return "false";		
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
	public String bookAdd() throws IOException{
        System.out.println(uploadFileName);
        if (upload != null) {
            // 获得文件上传的磁盘绝对路径
            String getrealPath = ServletActionContext.getServletContext().getRealPath("/images");
            int num=getrealPath.indexOf(".metadata");
            String realPath=getrealPath.substring(0,num).replace('/', '\\')+"spring-prj2\\WebContent\\images";
            System.out.println(realPath);
            // 创建一个文件
            File diskFile = new File(realPath + File.separator+ uploadFileName);
            // 文件上传,使用FileUtils工具类
            FileUtils.copyFile(upload, diskFile);
          }
        book.setPicture(uploadFileName);
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
		
		System.out.print(book.getDescription()+book.getId());
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
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
	public String pagingForUser(){
		System.out.print("~~!!page="+page);
		if(ServletActionContext.getRequest().getParameter("page") == null)
        //System.out.println("page="+a);
		this.pageBean = userService.queryForPageForUser(1,page);
		else
			this.pageBean = userService.queryForPageForUser(1,Integer.parseInt(ServletActionContext.getRequest().getParameter("page")));	
		this.customers = this.pageBean.getCustomers();
		return "success";
	}
	
	public String setFilter(){
		HttpServletRequest hsr =  ServletActionContext.getRequest();		
		Map<String, Object> session =  ActionContext.getContext().getSession();
		String account = hsr.getParameter("account_f");  //account form 
		session.put("account_s", account);     // account session
		String password = hsr.getParameter("password_f");
		session.put("password_s",password);
		String name = hsr.getParameter("name_f");
		session.put("name_s", name);
		String sex = hsr.getParameter("sex_f");
		session.put("sex_s", sex);
		String birthday = hsr.getParameter("birthday_f");
		session.put("birthday_s", birthday);
		String phone = hsr.getParameter("phone_f");
		session.put("phone_s", phone);
		String address = hsr.getParameter("address_f");
		session.put("address_s", address);	
		String zipcode = hsr.getParameter("zipcode_f");
		session.put("zipcode_s", zipcode);	
		String fax = hsr.getParameter("fax_f");
		session.put("fax_s", fax);	
		String permission = hsr.getParameter("permission_f");
		session.put("permission_s", permission);	
		System.out.print(account);
		return "success";
		
	}
	public String getCartInfor(){
		HttpServletRequest hsr =  ServletActionContext.getRequest();
		Map<String, Object> session = ActionContext.getContext().getSession();
		String desc = hsr.getParameter("desc");
		String urls = hsr.getParameter("url");
		String username  = session.get("loginedUser").toString();
		String userid  = session.get("loginedUserId").toString();
		lists = userService.getCustomerInfoById(userid);	
		Iterator its = lists.iterator(); 
		Customer customer = new Customer();
		while(its.hasNext()){  
		   customer=(Customer)its.next();
		  }  	
		order.setCustomer(customer);
		order.setPhoneNumber(customer.getPhone());
		order.setOrderPicSet(urls);
		order.setOrderDescription(desc);
		order.setReceiverName(username);
		order.setAddress(customer.getAddress());
        String arr[] = urls.split("\\|");
        for (int i = 0; i < arr.length; i++) {
        	listP.add(arr[i]);
           
        }
		
		return "success";

	}
	
	public ArrayList getListP() {
		return listP;
	}
	public String orderAdd() throws ParseException{
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid  = session.get("loginedUserId").toString();
		lists = userService.getCustomerInfoById(userid);	
		Iterator its = lists.iterator(); 
		Customer customer = new Customer();
		while(its.hasNext()){  
		   customer=(Customer)its.next();
		  }  	
		order.setCustomer(customer);
		userService.orderAdd(order);
		return "success";

	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	public String adminUpgrade(){
		String a = ServletActionContext.getRequest().getParameter("id");
		userService.adminUpgrade(a);
		return "success";
	}
	
	public String adminDegrade(){
		String a = ServletActionContext.getRequest().getParameter("id");
		userService.adminDegrade(a);
		return "success";
	}
	
	public String orderListAd(){
		lists =  userService.orderListAd();
		return "success";
	}		
	public String orderList(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid  = session.get("loginedUserId").toString();
		userService.orderList(userid);
		return "success";
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

}
