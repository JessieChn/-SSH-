package cn.edu.zjut.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.Customer;
import cn.edu.zjut.po.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.edu.zjut.service.BookService;

public class BookAction extends ActionSupport{
	private int page=1; //默认页面为1
	private BookService bookService=null;
	private PageBean pageBean;
	private List<Book> books;
	private List<Customer> customers;
	public String paging(){
		this.pageBean = bookService.queryForPage(1,page);
/*		System.out.println("当前页面："+this.pageBean.getCurPage());*/
		this.books = this.pageBean.getBooks();
		return "success";
	}	

	public String setFilter(){
		HttpServletRequest hsr =  ServletActionContext.getRequest();		
		Map<String, Object> session =  ActionContext.getContext().getSession();
		String bookname = hsr.getParameter("bookname_f");
		session.put("filter_book", bookname);
		String booktype = hsr.getParameter("booktype_f");
		session.put("filter_type", booktype);
		String bookdescription = hsr.getParameter("bookdescription_f");
		session.put("filter_description", bookdescription);
		String bookwriterlocation = hsr.getParameter("bookwriterlocation_f");
		System.out.println(bookwriterlocation+"~~");
		session.put("filter_writerlocation", bookwriterlocation);
		String bookpress = hsr.getParameter("bookpress_f");
		session.put("filter_press", bookpress);
		String bookpricemin = hsr.getParameter("pricemin_f");
		session.put("filter_pricemin", bookpricemin);
		String bookpricemax = hsr.getParameter("pricemax_f");
		session.put("filter_pricemax", bookpricemax);	
		return "success";
		
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public BookService getBookService() {
		return bookService;
	}
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

}
