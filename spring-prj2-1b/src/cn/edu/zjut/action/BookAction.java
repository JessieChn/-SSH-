package cn.edu.zjut.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.edu.zjut.po.Book;
import cn.edu.zjut.po.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.edu.zjut.service.BookService;

public class BookAction extends ActionSupport{
	private int page=1; //默认页面为1
	private BookService bookService=null;
	private PageBean pageBean;
	private List<Book> books;
	public String paging(){
		
/*		String a = ServletActionContext.getRequest().getParameter("page");
        System.out.println("page="+a);
        if(a==null)
        	page=1;
        else
        	page = Integer.parseInt(a);*/
		String a = (String) ActionContext.getContext().getSession().get("filter_book");
		System.out.println("filter_book"+a);
		this.pageBean = bookService.queryForPage(1,page);
/*		System.out.println("当前页面："+this.pageBean.getCurPage());*/
		this.books = this.pageBean.getBooks();
		return "success";
	}
	public String setFilter(){
		String bookname = ServletActionContext.getRequest().getParameter("bookname_f");
		ActionContext.getContext().getSession().put("filter_book", bookname);
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

}
